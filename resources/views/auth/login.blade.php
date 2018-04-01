@extends('layouts.app')

@section('content')
<div class="container" style="height:100vh;">
    <div class="row h-100 justify-content-center align-items-center">
        <div class="col">
            <h1 class="text-center py-2">FYP MS</h1>
            <p class="text-center py-2">One-stop platform to manage your Final Year Project</p>
            
            <form method="POST" action="{{ route('login') }}">
                {{ csrf_field() }}

                <div class="form-row">
                    <div class="form-group col-sm-10 offset-sm-1 col-md-8 offset-md-2
                    col-lg-6 offset-lg-3 col-xl-4 offset-xl-4{{ $errors->has('email') ? ' is-invalid' : '' }}">
                        <input type="email" class="form-control" id="inputEmail" placeholder="E-mail address"
                        name="email" value="{{ old('email') }}" required autofocus>  
                        @if ($errors->has('email'))
                            <span class="form-text">
                                <strong>{{ $errors->first('email') }}</strong>
                            </span>
                        @endif
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-sm-10 offset-sm-1 col-md-8 offset-md-2
                    col-lg-6 offset-lg-3 col-xl-4 offset-xl-4{{ $errors->has('password') ? ' is-invalid' : '' }}">
                        <input type="password" class="form-control" id="inputPassword" placeholder="Password"
                        name="password" required>
                        @if ($errors->has('password'))
                            <span class="form-text">
                                <strong>{{ $errors->first('password') }}</strong>
                            </span>
                        @endif
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-4 offset-md-4">
                        <div class="d-flex justify-content-center">
                            <div>
                                <input type="checkbox" class="form-check-input" id="checkRememberPassword"
                                name="remember" {{ old('remember') ? 'checked' : '' }}>
                                <label class="form-check-label{{ old('remember') ? ' active' : '' }}"
                                 for="checkRememberPassword">
                                    Remember me
                                </label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-sm-8 offset-sm-2 col-md-6 offset-md-3
                    col-lg-4 offset-lg-4 col-xl-2 offset-xl-5">
                        <div class="d-flex flex-column justify-content-center">
                            <button type="submit" class="btn btn-primary">
                                Login
                            </button>
                            <a class="btn btn-link" href="{{ route('password.request') }}">
                                Forgot password?
                            </a>
                        </div>
                    </div>
                </div>
            </form>

            <div class="row">
                <div class="col-sm-10 offset-sm-1 col-md-8 offset-md-2
                    col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
                    <div class="d-flex justify-content-between">
                        <a class="btn btn-light" href="{{ route('project.bank') }}">
                            Projects
                        </a>
                        <a class="btn btn-light" href="{{ route('faq') }}">
                            FAQs
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
