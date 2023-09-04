<?php

namespace App\Http\Middleware;

use Closure;

class User
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
        // Pre-Middleware Action

       if (auth()-> check() && auth()->user()->user_type=='user'){
             $response = $next($request);
             return $response;
        }

        else{
            return redirect('/');
        }
    }
}
