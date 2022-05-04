<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Marketplace L6</title>
    <link rel="stylesheet" href="/assets/fontawesome/css/all.css">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/style.css">
    <style>
        .front.row {
            margin-bottom: 40px;
        }

    </style>
    @yield('stylesheets')
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin-bottom: 40px;">

        <a class="navbar-brand" href="{{ route('home') }}">Marketplace L6</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <ul class="navbar-nav me-auto">
                <li class="nav-item @if (request()->is('/')) active @endif">
                    <a class="nav-link" href="{{ route('home') }}">Home <span
                            class="sr-only">(current)</span></a>
                </li>
                @foreach ($categories as $category)
                    <li class="nav-item @if (request()->is('category/' . $category->slug)) active @endif">
                        <a class="nav-link"
                            href="{{ route('category.single', ['slug' => $category->slug]) }}">{{ $category->name }}
                        </a>
                    </li>
                @endforeach
            </ul>

            @auth
                <ul class="navbar-nav me-auto">
                    <li class="nav-item @if (request()->is('admin/stores*')) active @endif">
                        <a class="nav-link" href="{{ route('admin.stores.index') }}">Lojas <span
                                class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item @if (request()->is('admin/products*')) active @endif">
                        <a class="nav-link" href="{{ route('admin.products.index') }}">Produtos</a>
                    </li>
                    <li class="nav-item @if (request()->is('admin/categories*')) active @endif">
                        <a class="nav-link" href="{{ route('admin.categories.index') }}">Categorias</a>
                    </li>
                </ul>

                <div class="my-2 my-lg-0">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#"
                                onclick="event.preventDefault();
                                                                                                                                                                                                                                                      document.querySelector('form.logout').submit(); ">Sair</a>

                            <form action="{{ route('logout') }}" class="logout" method="POST"
                                style="display:none;">
                                @csrf
                            </form>
                        </li>
                        <li class="nav-item">
                            <span class="nav-link">{{ auth()->user()->name }}</span>
                        </li>

                    </ul>
                </div>
            @endauth
            <ul class="navbar-nav ms-auto">
                @auth
                    <li class="nav-item  @if (request()->is('my-orders')) active @endif">
                        <a href="{{ route('user.orders')}}" class="nav-link">Meus Pedidos</a>
                    </li>
                @endauth

                <li class="nav-item">

                    <a href="{{ route('cart.index') }}" class="nav-link">
                        @if (session()->has('cart'))
                            {{-- <span class="badge bg-danger">{{ count(session()->get('cart')) }}</span> --}}
                            <span
                                class="badge bg-danger">{{ array_sum(array_column(session()->get('cart'), 'amount')) }}</span>
                        @endif
                        <span>
                            <i class=" fa-solid fa-cart-shopping"></i>

                        </span>
                    </a>
                </li>

                @auth
                    <li class="nav-item">
                        <form method="POST" action="{{ route('logout') }}">
                            @csrf
                            <button type="submit" class="btn btn-default text-light">Sair</button>
                        </form>
                    </li>
                @endauth
            </ul>
        </div>
    </nav>

    <div class="container">
        @include('flash::message')
        @yield('content')
    </div>

    @yield('scripts')
</body>

</html>
