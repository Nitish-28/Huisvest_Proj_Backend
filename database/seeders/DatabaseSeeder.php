<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Content;
use Spatie\Permission\Models\Role;


// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {

        // Create a role
        $role = Role::create(['name' => 'verhuurder']);
        $role = Role::create(['name' => 'admin']);

        User::factory()->create([
            'name' => 'Admin admin',
            'email' => 'admin@gmail.com',
        ]);

        // Assign a role to a user
        $user = User::find(1);
        $user->assignRole('admin');

        User::factory(10)->create();
        Content::factory(25)->create();
    }
}
