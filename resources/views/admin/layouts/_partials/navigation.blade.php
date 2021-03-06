<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Marketplace L8</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">

            @auth

                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link @if (request()->is('admin/stores*')) active @endif" aria-current="page"
                            href="{{ route('admin.orders.my') }}">Meus pedidos recebidos</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link @if (request()->is('admin/stores*')) active @endif" aria-current="page"
                            href="{{ route('admin.stores.index') }}">Lojas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link @if (request()->is('admin/products*')) active @endif"
                            href="{{ route('admin.products.index') }}">Produtos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link @if (request()->is('admin/categories*')) active @endif"
                            href="{{ route('admin.categories.index') }}">Categorias</a>
                    </li>
                    {{-- <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">
                        Dropdown
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                </li> --}}
                </ul>
                {{-- <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form> --}}
                <div class="my-2 my-lg-0">

                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a href="{{route('admin.notifications.index')}}" class="nav-link">
                                <span class="badge bg-danger">{{auth()->user()->notifications->count()}}</span>
                                <i class="fa fa-bell"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">

                                <span class="text-light">
                                    {{ auth()->user()->name }}
                                </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <form method="POST" action="{{ route('logout') }}">
                                @csrf
                                <button type="submit" class="btn btn-default text-light">Sair</button>
                            </form>

                        </li>
                    </ul>
                </div>

            @endauth

        </div>
    </div>
</nav>
