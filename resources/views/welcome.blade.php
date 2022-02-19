@extends('layouts.front')

@section('content')
    <div class="row mb-4 d-flex">

        @foreach ($products as $key => $product)
            <div class="col-md-4 d-flex flex-column">

                <div class="card flex-1 " style="width: 98%;  min-height:   490px">

                    <div class="mx-auto pt-2">

                        @if ($product->photos->count())
                            <img src="{{ asset('storage/' . $product->photos->first()->image) }}"
                                style="max-height: 200px;" alt="">
                            {{-- <img src="{{ asset('storage/' . $product->photos->first()->image) }}" class="card-img-top"
    alt=""> --}}
                        @else
                            {{-- <img src="{{ asset('assets/img/no-photo.jpg') }}" class="card-img-top" alt=""> --}}
                            <img src="{{ asset('assets/img/no-photo.jpg') }}" style="min-height: 200px; max-width: 100%"
                                alt="">
                        @endif

                    </div>

                    <div class="card-body d-flex flex-column justify-content-end">
                        <h2 class="card-title  h4">{{ $product->name }}</h2>
                        <p class="card-text">{{ $product->description }}</p>
                        <h3 class="h5">R$ {{ number_format($product->price, 2, ',', '.') }}</h3>
                        <a href="{{ route('product.single', ['slug' => $product->slug]) }}" class="btn btn-success">
                            Detalhes
                        </a>
                    </div>
                </div>
            </div>
            @if (($key + 1) % 3 == 0)
    </div>
    <div class="row mb-4">
        @endif
        @endforeach
    </div>
@endsection
