<?php

namespace App\Http\Controllers\Auth;

use DB;
use App\Models\User;
use App\Traits\ImageTrait;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use App\Providers\RouteServiceProvider;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;


class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;
    use ImageTrait;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            // 'name' => ['required', 'string', 'max:255'],
            // 'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            // 'mobile' => ['required', 'unique:users'],
            // 'password' => ['required', 'string', 'min:8', 'confirmed'],
            'first_name'    => ['required', 'string'],
            'last_name'     => ['required', 'string'],
            'email'         => ['required', 'email', 'unique:users,email'],
            'mobile'        => ['required', 'numeric', 'unique:users,mobile'],
            'password'      => ['required', 'same:confirm-password'],
            'status'        => ['required', 'in:0,1'],
            'roles_name'    => ['required'],
            'photo'         => ['required', 'image', 'mimes:jpeg,png,jpg,webp,gif,svg'],
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\Models\User
     */
    protected function create(array $data)
    {
        /*
        return User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'mobile' => $data['mobile'],
            'password' => Hash::make($data['password']),
        ]);
        */
        try {
            $user = User::create([
                'first_name'    => $data['first_name'],
                'last_name'     => $data['last_name'],
                'email'         => $data['email'],
                'mobile'        => $data['mobile'],
                'password'      => $data['password'],
                'status'        => $data['status'],
                'roles_name'    => $data['roles_name'],
                'password'      => Hash::make($data['password']),
                'created_by'    => 1,
            ]);
            
            //upload photo
            if ($data['photo']) {
                $this->uploadMedia($user, 'user', $data['photo']);
            }
            
            $user->assignRole($data['roles_name']);
            
            session()->flash('success');
            return $user;
        } catch (\Exception $e) {
            return redirect()->back()->withErrors(['error' => $e->getMessage()]);
        }
    }
}
