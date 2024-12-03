# Project Name
Daniaair_Task

## Steps Of Installation

** run command (git clone https://github.com/AhmedNassag/daniaair_task.git)
** make a copy file from .env.example and rename it to .env
** run command (composer install)
** run command (php artisan key:generate)
** run command (php artisan config:cache)
** give a name of variable DB_DATABASE in .env file
** make a database with this name
** run command (php artisan migrate:fresh --seed)


## Configuration In .env

** please put and replace this email configurations in .env file
MAIL_MAILER=smtp
MAIL_HOST=smtp.gmail.com
MAIL_PORT=587
MAIL_USERNAME=ahmednassag@gmail.com
MAIL_PASSWORD=ukyumnqeuamqizle
MAIL_ENCRYPTION=tls
MAIL_FROM_ADDRESS="ahmednassag@gmail.com"
MAIL_FROM_NAME="Ahmed Nabil"


## System Overview
This project is built using Laravel, a robust and scalable PHP framework designed to make web development easier and more efficient. The system is designed for managing tasks, users, and their priorities, with a flexible architecture for assigning tasks, handling their completion status, and tracking key metrics.

Key Features of the System
1- Task Management:

- Users can create, update, and delete tasks.
- Each task can have:
- A name and description.
- A status (pending, in-progress, completed).
- A priority level (low, medium, high).
- Assignment to a user.
- Timestamps for creation and updates.


2- User Management:

- The system supports multiple users, each with a unique role (e.g., admin, manager, employee).
- Tasks are assigned to users based on their availability and workload.
- The round-robin method is used to assign tasks efficiently, ensuring no user is overloaded.


3- Task Assignment:

- Tasks are assigned to users based on their current workload, ensuring that tasks are distributed evenly.
- Round-robin task assignment ensures that the user with the least active tasks gets the next task.
- The system calculates the task efficiency as (Completed Tasks / Total Tasks) * 100, giving insights into how - well tasks are being completed.


4- Database Structure:

- Users table stores user information such as name, email, role, and password.
- Tasks table stores task details like name, description, priority, status, and user assignments.
- Relationships between tasks and users:
    -- A task is assigned to a user and created by another user (may be the same or different).
    -- Users are associated with many tasks.


5- Notification & Alerts:

- The system may include notification features (e.g., email or in-app notifications) to inform users when a task is assigned or updated.
Flow of Operations


6- Task Creation:

- An admin or authorized user creates a new task by providing a name, description, priority, and assignment details.
- The system records the task with the status pending and assigns it to a user based on their current workload.


7- Task Update:

- As users progress on their tasks, they can update the status (e.g., from pending to in-progress).
Once a task is completed, the user updates the status to completed, you can change status of task by click on the value of record in the tasks screen.



### 1. Clone the repository

Clone the repository to your local machine using Git.
```bash
git clone https://github.com/AhmedNassag/daniaair_task.git
