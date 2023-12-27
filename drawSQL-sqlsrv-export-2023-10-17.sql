CREATE TABLE "product_images"(
    "product_id" NVARCHAR(255) NOT NULL,
    "url" NVARCHAR(255) NOT NULL
);
CREATE TABLE "brand"(
    "brand_id" VARCHAR(255) NOT NULL,
    "brand_name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "brand" ADD CONSTRAINT "brand_brand_id_primary" PRIMARY KEY("brand_id");
CREATE TABLE "customer"(
    "customer_id" INT NOT NULL,
    "fullname" NVARCHAR(255) NOT NULL,
    "phone_number" NVARCHAR(255) NOT NULL,
    "email" NVARCHAR(255) NOT NULL,
    "username" NVARCHAR(255) NOT NULL,
    "password" NVARCHAR(255) NOT NULL,
    "address" NVARCHAR(255) NULL
);
ALTER TABLE
    "customer" ADD CONSTRAINT "customer_customer_id_primary" PRIMARY KEY("customer_id");
CREATE TABLE "product"(
    "product_id" NVARCHAR(255) NOT NULL,
    "product_name" VARCHAR(255) NOT NULL,
    "product_quantity" INT NOT NULL,
    "product_price" INT NOT NULL,
    "product_description" NVARCHAR(255) NOT NULL,
    "discount" INT NOT NULL,
    "brand_id" VARCHAR(255) NOT NULL,
    "category_id" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "product" ADD CONSTRAINT "product_product_id_primary" PRIMARY KEY("product_id");
CREATE TABLE "order_item"(
    "order_id" VARCHAR(255) NOT NULL,
    "product_id" NVARCHAR(255) NOT NULL,
    "total_amount" INT NOT NULL
);
CREATE TABLE "specification"(
    "product_id" NVARCHAR(255) NOT NULL,
    "CPU" VARCHAR(255) NOT NULL,
    "GPU" VARCHAR(255) NOT NULL,
    "RAM" VARCHAR(255) NOT NULL,
    "Storage" VARCHAR(255) NOT NULL,
    "Screen" VARCHAR(255) NOT NULL,
    "Pin" VARCHAR(255) NOT NULL,
    "Weight" VARCHAR(255) NOT NULL,
    "OS" VARCHAR(255) NOT NULL
);
CREATE TABLE "order"(
    "order_id" VARCHAR(255) NOT NULL,
    "customer_id" INT NOT NULL,
    "order_date" DATE NOT NULL,
    "total_amount" INT NOT NULL,
    "address" NVARCHAR(255) NOT NULL,
    "status" BIT NOT NULL,
    "coupon_code" NVARCHAR(255) NOT NULL,
    "staff_id" INT NOT NULL
);
ALTER TABLE
    "order" ADD CONSTRAINT "order_order_id_primary" PRIMARY KEY("order_id");
CREATE TABLE "category"(
    "category_id" VARCHAR(255) NOT NULL,
    "category_name" NVARCHAR(255) NOT NULL
);
ALTER TABLE
    "category" ADD CONSTRAINT "category_category_id_primary" PRIMARY KEY("category_id");
CREATE TABLE "coupon"(
    "coupon_code" NVARCHAR(255) NOT NULL,
    "percentage" INT NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE NOT NULL
);
ALTER TABLE
    "coupon" ADD CONSTRAINT "coupon_coupon_code_primary" PRIMARY KEY("coupon_code");
CREATE TABLE "manager"(
    "manager_id" INT NOT NULL,
    "fullname" NVARCHAR(255) NOT NULL,
    "phone_number" NVARCHAR(255) NULL,
    "ssn" INT NULL,
    "username" NVARCHAR(255) NOT NULL,
    "password" NVARCHAR(255) NOT NULL,
    "role_id" INT NOT NULL
);
ALTER TABLE
    "manager" ADD CONSTRAINT "manager_manager_id_primary" PRIMARY KEY("manager_id");
CREATE TABLE "cart_item"(
    "cart_id" VARCHAR(255) NOT NULL,
    "customer_id" INT NOT NULL,
    "product_id" NVARCHAR(255) NOT NULL,
    "total_amount" INT NOT NULL
);
ALTER TABLE
    "cart_item" ADD CONSTRAINT "cart_item_cart_id_primary" PRIMARY KEY("cart_id");
ALTER TABLE
    "product" ADD CONSTRAINT "product_brand_id_foreign" FOREIGN KEY("brand_id") REFERENCES "brand"("brand_id");
ALTER TABLE
    "product" ADD CONSTRAINT "product_category_id_foreign" FOREIGN KEY("category_id") REFERENCES "category"("category_id");
ALTER TABLE
    "order" ADD CONSTRAINT "order_staff_id_foreign" FOREIGN KEY("staff_id") REFERENCES "manager"("manager_id");
ALTER TABLE
    "order_item" ADD CONSTRAINT "order_item_product_id_foreign" FOREIGN KEY("product_id") REFERENCES "product"("product_id");
ALTER TABLE
    "cart_item" ADD CONSTRAINT "cart_item_customer_id_foreign" FOREIGN KEY("customer_id") REFERENCES "customer"("customer_id");
ALTER TABLE
    "order" ADD CONSTRAINT "order_customer_id_foreign" FOREIGN KEY("customer_id") REFERENCES "customer"("customer_id");
ALTER TABLE
    "specification" ADD CONSTRAINT "specification_product_id_foreign" FOREIGN KEY("product_id") REFERENCES "product"("product_id");
ALTER TABLE
    "cart_item" ADD CONSTRAINT "cart_item_product_id_foreign" FOREIGN KEY("product_id") REFERENCES "product"("product_id");
ALTER TABLE
    "order_item" ADD CONSTRAINT "order_item_order_id_foreign" FOREIGN KEY("order_id") REFERENCES "order"("order_id");
ALTER TABLE
    "order" ADD CONSTRAINT "order_coupon_code_foreign" FOREIGN KEY("coupon_code") REFERENCES "coupon"("coupon_code");
ALTER TABLE
    "product_images" ADD CONSTRAINT "product_images_product_id_foreign" FOREIGN KEY("product_id") REFERENCES "product"("product_id");