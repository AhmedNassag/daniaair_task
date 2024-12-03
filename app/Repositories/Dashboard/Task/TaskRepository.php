<?php

namespace App\Repositories\Dashboard\Task;

use App\Models\Task;
use App\Models\User;
use Illuminate\Support\Facades\Mail;
use App\Repositories\Dashboard\BaseRepository;
use App\Mail\TaskUpdatedMail;
use App\Mail\TaskChangeStatusMail;

class TaskRepository extends BaseRepository implements TaskInterface
{
    public function getModel()
    {
        return new Task();
    }



    public function index($request)
    {
        $query = $this->getModel()
        ->when($request->name != null,function ($q) use($request){
            return $q->where('name','like', '%'.$request->name.'%');
        })
        ->when($request->description != null,function ($q) use($request){
            return $q->where('description','like', '%'.$request->description.'%');
        })
        ->when($request->status != null,function ($q) use($request){
            return $q->where('status',$request->status);
        })
        ->when($request->priority != null,function ($q) use($request){
            return $q->where('priority',$request->priority);
        })
        ->when($request->user_id != null,function ($q) use($request){
            return $q->where('user_id',$request->user_id);
        })
        ->when($request->from_date != null,function ($q) use($request){
            return $q->whereDate('created_at', '>=', $request->from_date);
        })
        ->when($request->to_date != null,function ($q) use($request){
            return $q->whereDate('created_at', '<=', $request->to_date);
        });

        if(auth()->user()->roles_name == 'Manager')
        {
            $data = $query->where('created_by', auth()->user()->id);
        }
        if(auth()->user()->roles_name == 'User')
        {
            $data = $query->where('user_id', auth()->user()->id);
        }
        else
        {
           $data = $query; 
        }
        $data = $data->paginate(config('myConfig.paginationCount'))->appends(request()->query());


        
        $users = User::where('roles_name', 'User')->get();
        

        return view('dashboard.tasks.index',compact('data','users'))
        ->with([
            'data'        => $data,
            'users'       => $users,
            'name'        => $request->name,
            'description' => $request->description,
            'status'      => $request->status,
            'priority'    => $request->priority,
            'user_id'     => $request->user_id,
            'from_date'   => $request->from_date,
            'to_date'     => $request->to_date,
        ]);
    }




    public function store($request)
    {
        try {
            $validated = $request->validated();
            $task      = Task::create($validated);
            if (!$task) {
                session()->flash('error');
                return redirect()->back();
            }
            
            // Call the function to assign the task in round-robin manner
            $assignedUser = $this->assignTaskRoundRobin($task);

            session()->flash('success');
            return redirect()->back();
        } catch (\Exception $e) {
            return redirect()->back()->withErrors(['error' => $e->getMessage()]);
        }
    }



    public function update($request)
    {
        try {
            $validated = $request->validated();
            $task      = Task::findOrFail($request->id);
            if (!$task) {
                session()->flash('error');
                return redirect()->back();
            }
            $task->update($validated);
            if (!$task) {
                session()->flash('error');
                return redirect()->back();
            }
            
            //send Mail
            if($task->user)
            {
                Mail::to($task->user->email)->send(new TaskUpdatedMail());
            }
            if($task->creator)
            {
                Mail::to($task->creator->email)->send(new TaskUpdatedMail());
            }

            session()->flash('success');
            return redirect()->back();
        } catch (\Exception $e) {
            return redirect()->back()->withErrors(['error' => $e->getMessage()]);
        }
    }




    public function changeStatus($id)
    {
        try {
            $task = $this->getModel()->find($id);
            if($task->status == 'pending')
            {
                $task->update(['status' => 'in-progress']);
            }
            elseif($task->status == 'in-progress')
            {
                $task->update(['status' => 'completed']);
            }
            else
            {
                $task->update(['status' => 'pending']);
            }
            if(!$task)
            {
                session()->flash('error');
                return redirect()->back();
            }
            
            //send Mail
            if($task->user)
            {
                Mail::to($task->user->email)->send(new TaskChangeStatusMail());
            }
            if($task->creator)
            {
                Mail::to($task->creator->email)->send(new TaskChangeStatusMail());
            }

            session()->flash('success');
            return redirect()->back();
        } catch (\Exception $e) {
            return redirect()->back()->withErrors(['error' => $e->getMessage()]);
        }
    }



    public function assignTaskRoundRobin($task)
    {
        // 1. Get all users with active tasks
        $users = User::where('roles_name', 'User')->withCount('tasks as active_tasks_count')->get();

        // 2. Sort the users by the number of active tasks (ascending order)
        $sortedUsers = $users->sortBy('active_tasks_count');

        // 3. Get the first user with the least active tasks
        $userToAssign = $sortedUsers->first();

        // 4. Assign the task to this user
        $task->user_id = $userToAssign->id;
        $task->save();

        return $userToAssign; // Return the user to whom the task was assigned
    }

}
