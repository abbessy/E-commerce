<?php

namespace App\Http\Middleware;

use Closure;

class Admin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        
        if (auth()-> check() && auth()->user()->user_type=='admin'){
             $response = $next($request);
             return $response;
        }

        else{
            return redirect('/');
        }

        
    }
}