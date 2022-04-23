## Gigih Family Catering - Ruby on Rails
### Oleh: KM_G2BE4132_Muhammad Syakurrahman
Final project assignment ini telah saya kerjakan dalam bentuk API dan View.
1. Testing program dapat langsung melakukan RUN agar dapat mengakses view aplikasi.
2. Testing API dapat dicoba menggunakan Postman, dimana API Documentation telah disediakan di bawah ini untuk mempermudah dalam testing.

## Use Case
1. Pengguna dapat menambah, mengubah, dan menghapus kategori pada halaman Category. Kategori ditambahkan agar dapat dipilih pada saat menambahkan menu baru.
2. Pengguna dapat menambah, mengubah, dan menghapus menu pada halaman Menu. Menu makanan ditambahkan agar dapat dipilih pada saat pengguna mencatatatkan Order.
3. Pengguna dapat menambahkan order pada halaman Order. Pengguna hanya dapat merubah merubah email pelanggan dan status (NEW, PAID, CANCELED) pada order. Setiap jam 5 sore untuk order yang belum dibayarkan akan secara otomatis berubah status menjadi "CANCELED".

## API Documentations

### 1. Category Feature
### GET
#### List of Categories
> ### Method:
> GET
> ### URL:
> /api/v1/categories

#### Show Category by Id
> ### Method:
> GET
> ### URL:
> /api/v1/categories/:id

### POST
#### Add new Category
> ### Method:
> POST
> ### URL:
> /api/v1/categories
> ### Parameter with Example:
> #### name : Mediterranean cuisine

### PUT
#### Update a Category
> ### Method:
> PUT
> ### URL:
> api/v1/categories/:id
> #### name : Dessert

### DELETE
#### Delete a Category
> ### Method:
> DELETE
> ### URL:
> api/v1/categories/:id

### 2. Menu Feature
### GET
#### List of Menus
> ### Method:
> GET
> ### URL:
> /api/v1/menus

#### Show Menu by Id
> ### Method:
> GET
> ### URL:
> /api/v1/menus/:id

### POST
#### Add new Menu
> ### Method:
> POST
> ### URL:
> /api/v1/menus
> ### Parameter with Example:
> #### name : Ayam Taliwang
> #### price : 25000
> #### description : Ayam Taliwang is a spicy Indonesian ayam bakar dish from Lombok.
> #### category_id[] : 3
> #### category_id[] : 4
> ### NOTE:
> Parameter dengan [] artinya Anda dapat memasukan banyak values secara berulang, artinya menu dapat mempunyai lebih dari 1 kategori.

### PUT
#### Update a Menu
> ### Method:
> PUT
> ### URL:
> api/v1/menus/:id
> #### name : Opor Ayam
> #### price : 18000
> #### description : Opor ayam is an Indonesian dish from Central Java consisting of chicken cooked in coconut milk.

### DELETE
#### Delete a Menu
> ### Method:
> DELETE
> ### URL:
> api/v1/menus/:id

### 3. Order Feature 
### GET
#### List of Orders
> ### Method:
> GET
> ### URL:
> /api/v1/orders

#### Show Order by Id
> ### Method:
> GET
> ### URL:
> /api/v1/orders/:id

### POST
#### Add new Order
> ### Method:
> POST
> ### URL:
> /api/v1/orders
> ### Parameter with Example:
> #### customer_email : chikothecat@gmail.com
> #### menu_id[] : 1
> #### quantity[] : 2
> #### menu_id[] : 14
> #### quantity[] : 1
> ### NOTE:
> Parameter dengan [] artinya Anda dapat memasukan banyak values secara berulang, dan harap mengisi quantity secara berurutan untuk setiap menu_id.

### PATCH
#### Update an Order
> ### Method:
> PATCH
> ### URL:
> api/v1/orders/:id
> ### Parameter with Example:
> #### customer_email : patrickthestar@gmail.com
> #### status : PAID
> ### NOTE:
> Hanya customer_email dan status yang dapat dirubah pada order

### DELETE
#### Delete an Order
> ### Method:
> DELETE
> ### URL:
> api/v1/orders/:id

## PDM
Gambar di atas merupakan PDM dari aplikasi yang saya kerjakan, yaitu terdiri dari 5 entitas utama.