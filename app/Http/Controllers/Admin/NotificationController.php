<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class NotificationController extends Controller
{
    //
    public function notifications(){
        $unreadNotifications = auth()->user()->unreadNotifications;

        return view('admin.notifications', compact('unreadNotifications'));
    }


    public function readAll(){
        $unreadNotifications = auth()->user()->unreadNotifications;

        $unreadNotifications->each(function($notification){
            $notification->markAsRead();
        });

        flash('Notificacões marcadas como lidas.')->success();
        return redirect()->back();
    }

    public function read($notification){
        $searchedNotification = auth()->user()->notifications()->find($notification);

        $searchedNotification->markAsRead();

        flash('Notificação marcada como lida.')->success();
        return redirect()->back();
    }
}
