<?php $page="login";?>
@extends('layouts.master2')
@section('content')
	<!-- Main Wrapper -->
	<div class="main-wrapper login-body">
		<div class="login-wrapper">
			<div class="container">
				<img class="img-fluid logo-dark mb-2" src="../assets_admin/img/logo-01.png" alt="Logo">
                <div class="loginbox">
					<div class="login-right">
						<div class="login-right-wrap">
							<h1>Ahmed Nabil Task</h1>
							<h1>{{ trans('main.Welcome Back') }}</h1>
							<div class="border mt-5 p-3">
								<div class="form-group">
									<h5 class="text-center" style="text-decoration:underline">لإمكانية تسجيل الدخول الرجاء إستخدام البيانات الآتية</h5>
								</div>
								<div class="form-group">
									<label>{{ trans('main.Email') }}</label>
									<input class="form-control" value="ahmednassag@gmail.com" disabled>
								</div>
								<div class="form-group">
									<label>{{ trans('main.Mobile') }}</label>
									<input class="form-control" value="01016856433" disabled>
								</div>
								<div class="form-group">
									<label>{{ trans('main.Password') }}</label>
									<input class="form-control" value="12345678" disabled>
								</div>
								<div class="form-group">
									<span class="text-danger">مع العلم بأنه يمكنك تسجيل الدخول عن طريق البريد الإلكترونى أو رقم الموبايل</span>
								</div>
							</div>
							<form method="POST" action="{{ route('login') }}">
								@csrf
								<div class="form-group form-focus mt-5">
									<input id="identify" type="text" class="form-control floating @error('identify') is-invalid @enderror" name="identify" value="01016856433">
									<label class="focus-label">{{ trans('main.Email Or Mobile') }}</label>
									@error('email')
										<span class="invalid-feedback" role="alert">
											<strong>{{ $message }}</strong>
										</span>
									@enderror
								</div>
								<div class="form-group form-focus">
									<input id="password" type="password" class="form-control floating @error('password') is-invalid @enderror" name="password" required autocomplete="current-password"  value="12345678">
									<label class="focus-label">{{ trans('main.Password') }}</label>
									@error('password')
										<span class="invalid-feedback" role="alert">
											<strong>{{ $message }}</strong>
										</span>
									@enderror
								</div>
								<button class="btn btn-primary btn-block btn-lg login-btn" type="submit">{{ trans('main.Login') }}</button>
								<a href="{{ route('register') }}">{{ trans('main.Register') }}</a>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /Main Wrapper -->
@endsection