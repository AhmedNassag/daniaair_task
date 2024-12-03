@extends('layouts.master')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8 mt-5">
            <div class="card">
                <div class="card-header text-center" style="background-color:#0F7997; color:#fff;">{{ __('main.Register') }}</div>

                <div class="card-body">
                    <form action="{{ route('register') }}" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
                        @csrf

                        <!-- first_name -->
                        <div class="form-group">
                            <label>{{ trans('main.First Name') }}</label>
                            <input class="form-control" type="text" class="form-control" name="first_name" value="{{ old('first_name') }}" required>
                        </div>
                        <!-- last_name -->
                        <div class="form-group">
                            <label>{{ trans('main.Last Name') }}</label>
                            <input class="form-control" type="text" class="form-control" name="last_name" value="{{ old('last_name') }}" required>
                        </div>
                        <!-- email -->
                        <div class="form-group">
                            <label>{{ trans('main.Email') }}</label>
                            <input class="email form-control" type="email" class="form-control" name="email" value="{{ old('email') }}" required>
                        </div>
                        <!-- mobile -->
                        <div class="form-group">
                            <label>{{ trans('main.Mobile') }}</label>
                            <input class="mobile form-control" type="text" class="form-control" name="mobile" value="{{ old('mobile') }}" required>
                        </div>
                        <!-- password -->
                        <div class="form-group">
                            <label>{{ trans('main.Password') }}</label>
                            <input class="password form-control" type="password" class="form-control" name="password" required>
                        </div>
                        <!-- confirm-password -->
                        <div class="form-group">
                            <label>{{ trans('main.Confirm') }} {{ trans('main.Password') }}</label>
                            <input class="confirm-password form-control" type="password" class="form-control" name="confirm-password" required>
                        </div>
                        <!-- status -->
                        <div class="form-group" style="display: none">
                            <label>{{ trans('main.Status') }}</label>
                            <select class="status form-control form-select" name="status" required>
                                <option value="1">{{ trans('main.Active') }}</option>
                                <option value="0">{{ trans('main.InActive') }}</option>
                            </select>
                        </div>
                        <!-- roles_name -->
                        <div class="form-group" readonly>
                            <label class="form-label">{{ trans('main.Role') }} :</label>
                            <select class="form-control form-select" name="roles_name" required>
                                <?php $roles = \Spatie\Permission\Models\Role::where('name', 'User')->get(); ?>
                                @foreach($roles as $role)
                                    <option value="{{ $role->name }}" {{ old('roles_name') == $role->id ? 'selected' : ''}}>{{ $role->name }}</option>
                                @endforeach
                            </select>
                            {{-- {!! Form::select('roles_name', $roles,[], array('class' => 'form-control')) !!} --}}
                        </div>
                        <!-- photo -->
                        <div class="form-group">
                            <label>{{ trans('main.Photo') }}</label>
                            <input class="form-control" type="file" class="form-control" name="photo" value="{{ old('photo') }}" required>
                        </div>

                        <div class="row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button id="storeBtn" type="submit" class="btn btn-primary">
                                    {{ __('main.Register') }}
                                </button>
                                <br>
                                <a href="{{ route('login') }}">{{ trans('main.Login') }}</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
