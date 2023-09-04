<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Cart;
use App\Models\Order;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{


    public function index()
    {
        
        // get All Products From Database
        $products = Product::all();
        return response()->json($products);

    }


    public function store(Request $request)
    {
        //POST(request)
        // Store all information of Products to Database
        //in_array()

        $product = new Product();


        // text data
        $product->title = $request->input('title');
        $product->price = $request->input('price');
        $product->description = $request->input('description');

        $product->save();
        return response()->json($product);


    }


    public function show($id)
    {
        // GET(id)
        // show each product by its ID from database
        $product = Product::find($id);
        return response()->json($product);
    }


    public function update(Request $request, $id)
    {
        
        // Update Info by Id

        $this->validate($request, [
            'title' => 'required',
            'description' => 'required',
            'price' => 'required'
         ]);

        $product = Product::find($id);

        // text Data
        $product->title = $request->input('title');
        $product->price = $request->input('price');
        $product->description = $request->input('description');

        $product->save();

        return response()->json($product);

    }


    public function destroy($id)
    {
        // DELETE(id)
        // Delete by Id
        $product = Product::find($id);
        $product->delete();
        return response()->json('Product Deleted Successfully');

    }

    public function addToCart(Request $request){
        try{
            if(auth()->check()){
        
            $cart = new Cart;
            $cart->user_id = auth()->user()->id;
            $cart->product_id = $request->input('product_id');
            $cart->save();
            return response()->json($cart);

            }
        }
        
        catch (\Exception $e) {
            return response()->json(['status' => 'error', 'message' => $e->getMessage()]);
        }
    }

    public static function cartItemCounter(){
        $userId = auth()->user()->id;
        return Cart::where('user_id',$userId)->count();
    }

    public function getCartLists(){

        $userId = auth()->user()->id;
        $products = DB::table('cart')
        ->join('products','cart.product_id','=','products.id')
        ->where('cart.user_id',$userId)
        ->select('products.*','cart.id as cart_id')
        ->get();

        return $products;
    }

    public function destroyItem($id){

        $cart = Cart::find($id);
        $cart->delete();
        return $items;
    }

    public function orderNowPrice(){
        $userId = auth()->user()->id;
         $total = DB::table('cart')
        ->join('products','cart.product_id','=','products.id')
        ->where('cart.user_id',$userId)   
        ->sum('products.price');

        return $total;
    }

    public function orderPlace(Request $request){
        $userId = auth()->user()->id;
        $cartItems = Cart::where('user_id',$userId)->get();
        $i = 0;

        $taille_tableau = Cart::where('user_id',$userId)->count();

        while($i < $taille_tableau){
        $order = new Order;
        $order->product_id = $cartItems[$i]->product_id;
        $order->user_id = $cartItems[$i]->user_id;
        $order->status = "pending";
        $order->payment_status = "pending";
        $order->address = $request->address;
        $order->save();
        Cart::where('user_id',$userId)->delete();
        $i = $i + 1 ;
        }

        return $cartItems;
    }

    public function getOrders(){
        $userId = auth()->user()->id;
         $orders = DB::table('orders')
        ->join('products','orders.product_id','=','products.id')
        ->where('orders.user_id',$userId)   
        ->get();

        return $orders;
    }

}