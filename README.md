## Gigih Family Catering - Ruby on Rails
### Oleh: KM_G2BE4132_Muhammad Syakurrahman
Final project assignment ini telah saya kerjakan dalam bentuk API dan View.
1. Testing program dapat langsung melakukan RUN agar dapat mengakses view aplikasi website.
2. Testing API dapat dicoba menggunakan Postman, dimana API documentation telah saya sediakan di bawah ini untuk mempermudah dalam mencobanya.

## API Documentations
### GET
#### List of Orders
> ### URL:
> /api/v1/orders
#### Show Order by Id
> ### URL:
> /api/v1/orders/:id
### POST
#### Add new Order
> ### URL:
> /api/v1/orders
> ### Parameter with Example:
> #### customer_email : chikothecat@gmail.com
> #### menu_id[] : 1
> #### quantity[] : 2
> #### menu_id[] : 14
> #### quantity[] : 1
> ### NOTE:
> Parameter dengan [] artinya Anda dapat memasukan banyak values secara berulang, dan tolong isi quantity secara berurutan untuk setiap menu_id.
### PATCH / PUT
#### Update an order
> ### URL:
> api/v1/orders/:id
> ### Parameter with Example:
> #### customer_email : patrickthestar@gmail.com
> #### status : PAID
> ### NOTE:
> Hanya customer_email dan status yang dapat dirubah pada order
### DELETE
#### Delete an order
> ### Method:
> DELETE
> ### URL:
> api/v1/orders/:id

## PDM
Gambar di atas merupakan PDM dari aplikasi yang saya kerjakan, yaitu terdiri dari 5 entitas utama.