@extends('admin.layouts.admin')

@section('content')
    <a href="{{ route('admin.notifications.readAll')}}" class="btn btn-lg btn-success">Marcar todas como lidas</a>
    <table class="table table-striped">
        <thead>
            <tr>

                <th>Notificação</th>
                <th>Criado em</th>
                <th>Ações</th>

            </tr>
        </thead>
        <tbody>
            @forelse ($unreadNotifications as $notification)
                <tr>
                    <!--  -->
                    <td>{{ $notification->data['message'] || 'No message received' }}</td>
                    {{-- <td>{{ $notification->created_at->format('d/m/Y H:i:s')}}</td> --}}
                    <td>{{ $notification->created_at->locale('pt')->diffForHumans()}}</td>
                                  <td>
                        <div class="btn-group">
                            <a href="{{ route('admin.notifications.read', ['notification' => $notification->id])}}"
                                class="btn btn-default btn-sm me-2">Marcar como lida</a>

                        </div>


                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="3">
                        <div class="alert alert-warning">Nenhuma notificação encontrada.</div>
                    </td>
                </tr>
            @endforelse
        </tbody>
    </table>
    {{ empty($products) ? 'Não há produtos cadastrados.' : $products->links() }}
@endsection
