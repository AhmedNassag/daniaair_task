<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class CreateManagerRoleSeeder extends Seeder
{
    /**
    * Run the database seeds.
    *
    * @return void
    */
    public function run()
    {
        $role        = Role::create(['name' => 'Manager']);
    
        $permissions = Permission::whereIn('name',['عرض المهمات', 'إضافة المهمات', 'تعديل المهمات', 'تكليف المهمات'])->pluck('id','name')->all();
        
        $role->syncPermissions($permissions);
    }
}