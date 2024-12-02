<!-- Sidebar -->
<div class="sidebar" id="sidebar">
	<div class="sidebar-inner slimscroll">
		<div id="sidebar-menu" class="sidebar-menu">
			<ul>
				<li class="menu-title"><span>Coding System</span></li>
				<li class="{{ Request::is('/home') ? 'active' : '' }}">
					<a href="{{ route('home') }}"><i data-feather="home"></i> <span>{{ trans('main.Dashboard') }}</span></a>
				</li>
				<li class="{{ Request::is('admin/user','admin/role') ? 'active' : '' }} submenu">
					<a href="#"><i data-feather="users"></i> <span>{{ trans('main.Users Roles') }}</span> <span class="menu-arrow"></span></a>
					<ul>
						@can('عرض المستخدمين')
						<li class="ml-1"><a class=" {{ Request::is('admin/user') ? 'active' : '' }}" href="{{ route('user.index') }}">{{ trans('main.Users') }}</a></li>
						@endcan

						@can('عرض الصلاحيات')
						<li class="ml-1">
							<a class=" {{ Request::is(['admin/role', 'admin/role/create', 'admin/role/*/edit', 'admin/role/*']) ? 'active' : '' }}" href="{{ route('role.index') }}">
								{{ trans('main.Roles') }}
							</a>
						</li>
						@endcan
					</ul>
				</li>

				@can('عرض المهمات')
				<li class="{{ Request::is('admin/task') ? 'active' : '' }}">
					<a href="{{ route('task.index') }}"><i data-feather="file-text"></i> <span>{{ trans('main.Tasks') }}</span></a>
				</li>
				@endcan
			</ul>
		</div>
	</div>
</div>
<!-- /Sidebar -->