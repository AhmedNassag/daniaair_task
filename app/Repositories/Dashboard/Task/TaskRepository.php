<?php

namespace App\Repositories\Dashboard\Task;

use App\Models\Task;
use App\Models\User;
use App\Repositories\Dashboard\BaseRepository;

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
            $data = $query->whereRelation('employee','created_by', auth()->user()->id)->orWhere('created_by', auth()->user()->id);
        }
        if(auth()->user()->roles_name == 'Employee')
        {
            $data = $query->where('employee_id', auth()->user()->id);
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
            'user_id'     => $request->user_id,
            'from_date'   => $request->from_date,
            'to_date'     => $request->to_date,
        ]);
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
            session()->flash('success');
            return redirect()->back();
        } catch (\Exception $e) {
            return redirect()->back()->withErrors(['error' => $e->getMessage()]);
        }
    }

}
