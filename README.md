# README

This API allows a user to make a request with an array of image dimensions ([w,h]) and a bounding box dimension ([w,h]) and receive back scaled image dimensions. It can handle multiple sets of image dimensions to be scaled in the format [w,h,w,h,w,h], etc. See below for example usage:

## Scaling Image Dimensions

* URL: https://mfstylelend.herokuapp.com/api/v1/resizers

* Method: GET
* Request Arguments: 

  * *image_dimensions* - required - a one-dimensional array of image dimensions to be scaled

  * *bounding_box* - required - a one-dimensional array of one set of dimensions


## Example Request:

URL: 

    https://mfstylelend.herokuapp.com/api/v1/resizers?image_dimensions=[1256,1200,600,800,200,200,400,200,800,1256]&bounding_box=[200,200]


RESPONSE:

    {scaled_dimensions: [200, 191, 150, 200, 200, 200, 200,100, 127, 200], 
    bounding_box: [200,200]}



## Instructions for Use

* Fork and clone this repo
* Run `bundle` 
* Run `rake db:migrate` (you may have to run `rake db:create` first)
* Run `rails s`
* Visit `localhost:3000/api/v1/resizers` followed by your request arguments. See above for formatting details 