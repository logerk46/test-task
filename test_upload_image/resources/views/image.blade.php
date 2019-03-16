@extends('welcome')
@section('content')
    <!-- add meta tags -->
    <div class="fb-share-button"
         data-href="/"
         data-layout="button_count">
    </div>
    <a class="twitter-share-button"
       href="https://twitter.com/intent/tweet?text=Title: {{$image->title}} Description: {{strip_tags($image->description)}}"
       data-size="large">
        Tweet</a>
    <div class="image-detail col-md-12 mt-4 mb-4">
        <div class="row">
            <div class="title mx-auto text-center">
                <h3>{{$image->title}}</h3>
                <img class="img-responsive image_src" src="{{URL::asset('/images/' . $image->image_name)}}"/>
                <span class="img-text-detail">{!!$image->description!!}</span>
            </div>
        </div>
    </div>
@endsection
