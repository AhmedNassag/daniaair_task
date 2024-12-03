<?php

namespace App\Http\Controllers;

use DB;
use App\Models\Task;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        // if(auth()->user()->roles_name == 'Manager')
        // {
        //     $managers_count  = \App\Models\User::where('created_by', auth()->user()->id)->where('roles_name', 'Manager')->count();
        //     $employees_count = \App\Models\User::where('created_by', auth()->user()->id)->where('roles_name', 'User')->count();
        //     $tasks_count     = \App\Models\Task::where('created_by', auth()->user()->id)->count();
        // }
        // else if(auth()->user()->roles_name == 'User')
        // {
        //     $managers_count  = \App\Models\User::where('created_by', auth()->user()->created_by)->where('roles_name', 'Manager')->count();
        //     $employees_count = \App\Models\User::where('created_by', auth()->user()->created_by)->where('roles_name', 'Employee')->count();
        //     $tasks_count     = \App\Models\Task::where('user_id', auth()->user()->id)->count();
        // }
        // else
        // {
        //     $managers_count  = \App\Models\User::where('roles_name', 'Manager')->count();
        //     $employees_count = \App\Models\User::where('roles_name', 'User')->count();
        //     $tasks_count     = \App\Models\Task::count();
        // }
        $totalUsersByRole              = Role::withCount('users')->get();

        $totalTasksByStatusAndPriority = Task::select('status', 'priority', DB::raw('COUNT(*) as total'))->groupBy('status', 'priority')->get();
        
        $completedTasks = Task::where('status', 'completed')->count();
        $totalTasks     = Task::count();
        $efficiency     = $totalTasks > 0 ? ($completedTasks / $totalTasks) * 100 : 0;

        return view('home',compact(/*'managers_count','employees_count','tasks_count'*/'totalUsersByRole','totalTasksByStatusAndPriority','efficiency'));
    }
}
