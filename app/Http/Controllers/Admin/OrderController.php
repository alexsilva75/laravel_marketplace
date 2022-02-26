<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\UserOrder;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    //
    private $order;

    public function __construct(UserOrder $order)
    {
        $this->order = $order;
    }
}
