# Tickets API

This repo if for Tickets you can use it to retrieve a Code for the Ticket and a QR Code as svg image. 

## Getting Started


### Pre-requisites and Local Development (macOs)


Developers who wish to work on this project should already have ruby 3, rails 7 & sqlite3 ~> 1.4.

### Dependencies

This project uses the following third-party libraries:

- [rqrcode](https://github.com/whomwah/rqrcode): A Ruby library for generating QR codes. It is used in this API to create QR codes in SVG format for the tickets.

### Installation Instructions

To install the `rqrcode` gem, add it to your `Gemfile`:

```ruby
gem 'rqrcode'
```
Then run

 ```
  bundle install 
 ```


## API Reference 


### Getting Started 


Base URL : This API runs on local host : http://127.0.0.1:3000

Authentication: This version of the application doesn't require authentication or api Keys

### API Endpoints

#### Get '/tickets'

Excpects: None 

Returns: A list of ticket objects containing their id, code, and timestamps.

Sample: 
```curl 
curl  http://127.0.0.1:3000/tickets
```
```json
[
    {
        "id": 1,
        "code": "d1a76ae012d74d16c35b6c0862e5e16d",
        "created_at": "2024-09-10T08:18:43.711Z",
        "updated_at": "2024-09-10T08:18:43.717Z"
    },
    {
        "id": 2,
        "code": "e4b7b7c776e8ac4a93aba2e44cd37592",
        "created_at": "2024-09-10T08:20:20.012Z",
        "updated_at": "2024-09-10T08:20:20.016Z"
    },
]
```

### POST '/tickets'

Expects: None

Returns: A new ticket object with id and code.

Sampel:
```curl
curl  http://127.0.0.1:3000/tickets -X POST
```
```json
[
    {
    "id": 6,
    "code": "599fb5d7a7f5fd19bddadbd965e48804",
    "created_at": "2024-10-15T15:32:26.733Z",
    "updated_at": "2024-10-15T15:32:26.737Z"
    },    
]
```
#### GET '/tickets/<id>'

Expects: None

Returns: QR code with provided id

Sample:
```curl 
curl http://127.0.0.1:3000/tickets/6
``` 
```json
[
    {
    "id": 6,
    "code": "599fb5d7a7f5fd19bddadbd965e48804",
    "created_at": "2024-10-15T15:32:26.733Z",
    "updated_at": "2024-10-15T15:32:26.737Z"
    },    
]
```
#### GET 'tickets/id/qr'
Expects: A ticket id.
Returns: The QR code for the provided ticket id as an SVG image.

Sample: 
```curl 
curl http://127.0.0.1:3000/tickets/6/qr
```
The request will return the QR code in SVG format.
![Alt text](http://127.0.0.1:3000/tickets/6/qr)

### Acknowledgments 

Special thanks to the rqrcode library for providing the functionality to generate QR codes.

