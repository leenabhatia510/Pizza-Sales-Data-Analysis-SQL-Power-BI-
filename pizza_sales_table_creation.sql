CREATE TABLE public.pizza_sales
(
    pizza_id integer,
    order_id integer,
    pizza_name_id text
    quantity integer,
    order_date date,
    order_time text,
    unit_price numeric,
    total_price numeric,
    pizza_size text,
    pizza_category text,
    pizza_ingredients text,
    pizza_name text,
    PRIMARY KEY (pizza_id)
);

ALTER TABLE IF EXISTS public.pizza_sales
    OWNER to postgres;


SELECT * FROM pizza_sales