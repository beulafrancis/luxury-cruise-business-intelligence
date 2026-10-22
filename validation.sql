--01_create_tables.sql

--1. ancillary delivery

CREATE TABLE IF NOT EXISTS public.ancillary_delivery
(
    delivery_id integer NOT NULL,
    route_id integer NOT NULL,
    port_call_id integer NOT NULL,
    product_type character varying(100) COLLATE pg_catalog."default" NOT NULL,
    quantity integer NOT NULL,
    revenue numeric(12,2) NOT NULL,
    delivery_cost numeric(12,2) NOT NULL,
    delivery_status character varying(20) COLLATE pg_catalog."default" NOT NULL,
    delivery_date date,
    CONSTRAINT ancillary_delivery_pkey PRIMARY KEY (delivery_id),
    CONSTRAINT fk_delivery_port_call FOREIGN KEY (port_call_id)
        REFERENCES public.port_call (port_call_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_delivery_route FOREIGN KEY (route_id)
        REFERENCES public.route_route_change (route_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT chk_delivery_cost CHECK (delivery_cost >= 0::numeric),
    CONSTRAINT chk_delivery_quantity CHECK (quantity > 0),
    CONSTRAINT chk_delivery_revenue CHECK (revenue >= 0::numeric)
)




--2.calendar. create table
CREATE TABLE IF NOT EXISTS public.calendar
(
    date date NOT NULL,
    year integer NOT NULL,
    quarter integer NOT NULL,
    quarter_name character varying(10) COLLATE pg_catalog."default",
    month_number integer NOT NULL,
    month_name character varying(20) COLLATE pg_catalog."default" NOT NULL,
    month_year character varying(20) COLLATE pg_catalog."default" NOT NULL,
    week_number integer NOT NULL,
    day integer NOT NULL,
    day_name character varying(20) COLLATE pg_catalog."default" NOT NULL,
    is_weekend boolean NOT NULL,
    year_month_number integer,
    CONSTRAINT calendar_pkey PRIMARY KEY (date)
)


--3.new_activity_booking

CREATE TABLE IF NOT EXISTS public.new_activity_booking
(
    activity_booking_id bigint,
    passenger_id integer,
    activity_name character varying(100) COLLATE pg_catalog."default",
    activity_category character varying(50) COLLATE pg_catalog."default",
    port_name character varying(50) COLLATE pg_catalog."default",
    booking_date date,
    activity_date date,
    start_time time without time zone,
    duration_hours numeric(5,2),
    minimum_age integer,
    capacity integer,
    activity_price numeric(10,2),
    quantity integer,
    total_price numeric(12,2),
    booking_status character varying(20) COLLATE pg_catalog."default",
    payment_status character varying(20) COLLATE pg_catalog."default",
    booking_source character varying(30) COLLATE pg_catalog."default",
    cancellation_reason character varying(100) COLLATE pg_catalog."default",
    port_id integer
)

--4.Food Bevarage

CREATE TABLE IF NOT EXISTS public.new_food
(
    food_transaction_id integer,
    transaction_date date,
    food_item text COLLATE pg_catalog."default",
    serving_location text COLLATE pg_catalog."default",
    unit text COLLATE pg_catalog."default",
    opening_quantity integer,
    received_quantity integer,
    sold_quantity integer,
    waste_quantity integer,
    closing_quantity integer,
    unit_price integer,
    cost_per_unit integer,
    gross_revenue integer,
    discount_amount numeric,
    net_revenue numeric,
    food_cost integer,
    profit numeric,
    payment_method text COLLATE pg_catalog."default",
    inventory_status text COLLATE pg_catalog."default",
    port_id integer
)



--5.new_passenger

CREATE TABLE IF NOT EXISTS public.new_passenger
(
    passenger_id integer,
    passenger_name character varying(100) COLLATE pg_catalog."default",
    age integer,
    gender character varying(20) COLLATE pg_catalog."default",
    nationality character varying(50) COLLATE pg_catalog."default",
    passport_status character varying(20) COLLATE pg_catalog."default",
    medical_clearance character varying(20) COLLATE pg_catalog."default",
    passenger_status character varying(20) COLLATE pg_catalog."default",
    booking_id integer,
    booking_date date,
    travel_date date,
    embarkation_port character varying(50) COLLATE pg_catalog."default",
    disembarkation_port character varying(50) COLLATE pg_catalog."default",
    travel_class character varying(30) COLLATE pg_catalog."default",
    booking_price numeric(12,2),
    booking_status character varying(20) COLLATE pg_catalog."default",
    special_assistance character varying(10) COLLATE pg_catalog."default",
    dietary_preference character varying(40) COLLATE pg_catalog."default",
    cancellation_reason character varying(100) COLLATE pg_catalog."default",
    port_id integer,
    cabin_id integer,
    cabin_number character varying(20) COLLATE pg_catalog."default",
    deck_number integer,
    cabin_type character varying(50) COLLATE pg_catalog."default",
    cabin_area_sqft integer,
    occupancy_capacity integer,
    sea_view character varying(10) COLLATE pg_catalog."default",
    balcony character varying(10) COLLATE pg_catalog."default",
    room_service character varying(10) COLLATE pg_catalog."default",
    nights_booked integer,
    food_cost numeric(12,2),
    disembarkation_date date
)

--6.port_call
CREATE TABLE IF NOT EXISTS public.port_call
(
    port_call_id integer NOT NULL,
    port_id integer NOT NULL,
    port_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    city character varying(100) COLLATE pg_catalog."default",
    country character varying(100) COLLATE pg_catalog."default",
    continent character varying(50) COLLATE pg_catalog."default",
    port_type character varying(50) COLLATE pg_catalog."default",
    port_code character varying(10) COLLATE pg_catalog."default",
    sequence_no integer,
    arrival_time timestamp without time zone,
    departure_time timestamp without time zone,
    stay_hours numeric(6,2),
    distance_from_previous_nm numeric(10,2),
    distance_to_next_nm numeric(10,2),
    berth_name character varying(100) COLLATE pg_catalog."default",
    berth_status character varying(30) COLLATE pg_catalog."default",
    port_fee numeric(12,2),
    passenger_embarkation integer,
    passenger_disembarkation integer,
    fuel_bunkering character varying(10) COLLATE pg_catalog."default",
    fresh_water_supply character varying(10) COLLATE pg_catalog."default",
    food_restocking character varying(10) COLLATE pg_catalog."default",
    port_operation_status character varying(30) COLLATE pg_catalog."default",
    weather_condition character varying(50) COLLATE pg_catalog."default",
    weather_delay_hours numeric(5,2),
    port_call_status character varying(30) COLLATE pg_catalog."default",
    latitude numeric(10,6),
    longitude numeric(10,6),
    berth_count integer,
    port_accessibility character varying(30) COLLATE pg_catalog."default",
    arrival_date date,
    route_id integer,
    CONSTRAINT port_call_pkey PRIMARY KEY (port_call_id),
    CONSTRAINT fk_port_call_route FOREIGN KEY (route_id)
        REFERENCES public.route_route_change (route_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)



--7.port_dimension

CREATE TABLE IF NOT EXISTS public.port_dimension
(
    port_id integer,
    port_name character varying(100) COLLATE pg_catalog."default",
    city character varying(100) COLLATE pg_catalog."default",
    country character varying(100) COLLATE pg_catalog."default",
    continent character varying(50) COLLATE pg_catalog."default",
    port_type character varying(50) COLLATE pg_catalog."default",
    port_code character varying(10) COLLATE pg_catalog."default"
)


--8.port_tax_fee

CREATE TABLE IF NOT EXISTS public.port_tax_fee
(
    tax_fee_id integer NOT NULL,
    port_call_id integer NOT NULL,
    tax_type character varying(100) COLLATE pg_catalog."default" NOT NULL,
    tax_rate numeric(5,2),
    taxable_amount numeric(12,2) NOT NULL,
    tax_amount numeric(12,2) NOT NULL,
    payment_status character varying(20) COLLATE pg_catalog."default" NOT NULL,
    currency character varying(10) COLLATE pg_catalog."default" DEFAULT 'USD'::character varying,
    tax_date date,
    gst_rate numeric(5,2),
    gst_amount numeric(14,2),
    tcs_rate numeric(5,2),
    tcs_amount numeric(14,2),
    CONSTRAINT port_tax_fee_pkey PRIMARY KEY (tax_fee_id),
    CONSTRAINT fk_tax_port_call FOREIGN KEY (port_call_id)
        REFERENCES public.port_call (port_call_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT chk_tax_amount CHECK (tax_amount >= 0::numeric),
    CONSTRAINT chk_tax_rate CHECK (tax_rate >= 0::numeric),
    CONSTRAINT chk_taxable_amount CHECK (taxable_amount >= 0::numeric)
)


--9.route_route_change

CREATE TABLE IF NOT EXISTS public.route_route_change
(
    route_id integer NOT NULL,
    route_change_id integer,
    ship_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    sequence_no integer NOT NULL,
    from_port character varying(100) COLLATE pg_catalog."default" NOT NULL,
    from_city character varying(100) COLLATE pg_catalog."default",
    from_country character varying(100) COLLATE pg_catalog."default",
    to_port character varying(100) COLLATE pg_catalog."default" NOT NULL,
    to_city character varying(100) COLLATE pg_catalog."default",
    to_country character varying(100) COLLATE pg_catalog."default",
    from_latitude numeric(9,6),
    from_longitude numeric(9,6),
    to_latitude numeric(9,6),
    to_longitude numeric(9,6),
    planned_departure timestamp without time zone,
    planned_arrival timestamp without time zone,
    actual_departure timestamp without time zone,
    actual_arrival timestamp without time zone,
    distance_nm numeric(10,2),
    estimated_speed_knots numeric(5,2),
    fuel_consumption_mt numeric(10,2),
    fuel_cost numeric(12,2),
    route_status character varying(30) COLLATE pg_catalog."default",
    route_change_status character varying(30) COLLATE pg_catalog."default",
    change_reason character varying(100) COLLATE pg_catalog."default",
    original_destination character varying(100) COLLATE pg_catalog."default",
    weather_impact character varying(50) COLLATE pg_catalog."default",
    weather_delay_hours numeric(5,2),
    sea_condition character varying(30) COLLATE pg_catalog."default",
    navigation_status character varying(30) COLLATE pg_catalog."default",
    fuel_bunkering_required character varying(10) COLLATE pg_catalog."default",
    emergency_diversion character varying(10) COLLATE pg_catalog."default",
    route_notes character varying(200) COLLATE pg_catalog."default",
    additional_fuel_litres numeric(12,2),
    additional_fuel_cost numeric(12,2),
    additional_charge numeric(12,2),
    additional_cost numeric(12,2),
    estimated_revenue_impact numeric(14,2),
    CONSTRAINT route_route_change_pkey PRIMARY KEY (route_id)
)


--10.staff

CREATE TABLE IF NOT EXISTS public.staff
(
    staff_id integer NOT NULL,
    staff_name character varying(150) COLLATE pg_catalog."default" NOT NULL,
    gender character varying(20) COLLATE pg_catalog."default" NOT NULL,
    age integer NOT NULL,
    nationality character varying(60) COLLATE pg_catalog."default" NOT NULL,
    department character varying(60) COLLATE pg_catalog."default" NOT NULL,
    job_role character varying(100) COLLATE pg_catalog."default" NOT NULL,
    employment_type character varying(30) COLLATE pg_catalog."default" NOT NULL,
    hire_date date NOT NULL,
    contract_end_date date,
    experience_years numeric(4,1) NOT NULL,
    shift_type character varying(30) COLLATE pg_catalog."default" NOT NULL,
    work_location character varying(100) COLLATE pg_catalog."default" NOT NULL,
    salary_monthly numeric(12,2) NOT NULL,
    overtime_hours numeric(6,1) DEFAULT 0,
    overtime_pay numeric(12,2) DEFAULT 0,
    certification_status character varying(30) COLLATE pg_catalog."default",
    performance_rating numeric(3,1),
    attendance_days integer,
    staff_status character varying(30) COLLATE pg_catalog."default" NOT NULL,
    salary_date date,
    CONSTRAINT staff_pkey PRIMARY KEY (staff_id),
    CONSTRAINT chk_attendance CHECK (attendance_days >= 0 AND attendance_days <= 31),
    CONSTRAINT chk_experience CHECK (experience_years >= 0::numeric),
    CONSTRAINT chk_overtime CHECK (overtime_hours >= 0::numeric),
    CONSTRAINT chk_overtime_pay CHECK (overtime_pay >= 0::numeric),
    CONSTRAINT chk_performance CHECK (performance_rating >= 1::numeric AND performance_rating <= 5::numeric),
    CONSTRAINT chk_salary CHECK (salary_monthly >= 0::numeric),
    CONSTRAINT chk_staff_age CHECK (age >= 18 AND age <= 70)
)


--11.weather_climate


CREATE TABLE IF NOT EXISTS public.weather_climate
(
    weather_climate_id integer NOT NULL,
    port_call_id integer,
    month_number integer,
    month_name character varying(20) COLLATE pg_catalog."default",
    port_name character varying(100) COLLATE pg_catalog."default",
    city character varying(100) COLLATE pg_catalog."default",
    country character varying(100) COLLATE pg_catalog."default",
    continent character varying(50) COLLATE pg_catalog."default",
    climate_zone character varying(50) COLLATE pg_catalog."default",
    climate_type character varying(50) COLLATE pg_catalog."default",
    season character varying(30) COLLATE pg_catalog."default",
    temperature_min_c numeric(5,2),
    temperature_max_c numeric(5,2),
    average_temperature_c numeric(5,2),
    rainfall_level character varying(20) COLLATE pg_catalog."default",
    rainfall_pattern character varying(50) COLLATE pg_catalog."default",
    humidity_level character varying(20) COLLATE pg_catalog."default",
    wind_condition character varying(40) COLLATE pg_catalog."default",
    sea_condition character varying(30) COLLATE pg_catalog."default",
    storm_risk character varying(20) COLLATE pg_catalog."default",
    cyclone_risk character varying(20) COLLATE pg_catalog."default",
    weather_condition character varying(50) COLLATE pg_catalog."default",
    cruise_suitability character varying(30) COLLATE pg_catalog."default",
    activity_impact character varying(50) COLLATE pg_catalog."default",
    route_risk character varying(30) COLLATE pg_catalog."default",
    climate_notes character varying(200) COLLATE pg_catalog."default",
    data_source character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT weather_climate_pkey PRIMARY KEY (weather_climate_id)
)



-- Step 1: Table Row Count Validation

SELECT
    table_name,
    (xpath(
        '/row/count/text()',
        query_to_xml(
            format('SELECT COUNT(*) AS count FROM %I.%I',
                   table_schema, table_name),
            false, true, ''
        )
    ))[1]::text::bigint AS total_rows
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_type = 'BASE TABLE'
ORDER BY table_name;


-- Step 2: NULL Value Validation

SELECT
    table_name,
    column_name,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
  AND is_nullable = 'YES'
ORDER BY table_name, ordinal_position;



-- Step 3: Actual NULL Value Validation


SELECT
    COUNT(*) FILTER (WHERE delivery_date IS NULL)
        AS ancillary_delivery_null_dates
FROM ancillary_delivery;

SELECT
    COUNT(*) FILTER (WHERE quarter_name IS NULL)
        AS calendar_null_quarters,
    COUNT(*) FILTER (WHERE year_month_number IS NULL)
        AS calendar_null_year_months
FROM calendar;

SELECT
    COUNT(*) FILTER (WHERE meal_period IS NULL)
        AS null_meal_period,
    COUNT(*) FILTER (WHERE food_item IS NULL)
        AS null_food_item,
    COUNT(*) FILTER (WHERE category IS NULL)
        AS null_category,
    COUNT(*) FILTER (WHERE serving_location IS NULL)
        AS null_serving_location,
    COUNT(*) FILTER (WHERE unit IS NULL)
        AS null_unit
FROM food_beverage_inventory;



-- Step 4: Duplicate Record Validation


SELECT
    'passenger' AS table_name,
    COUNT(*) AS total_rows,
    COUNT(DISTINCT passenger_id) AS unique_ids,
    COUNT(*) - COUNT(DISTINCT passenger_id) AS duplicate_ids
FROM passenger

UNION ALL

SELECT
    'new_passenger',
    COUNT(*),
    COUNT(DISTINCT passenger_id),
    COUNT(*) - COUNT(DISTINCT passenger_id)
FROM new_passenger;


-- Step 5: Check Calendar Table Columns

SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'calendar'
ORDER BY ordinal_position;


-- Step 6: Date Range Validation


SELECT
    'ancillary_delivery' AS table_name,
    MIN(delivery_date) AS first_date,
    MAX(delivery_date) AS last_date
FROM ancillary_delivery

UNION ALL

SELECT
    'calendar',
    MIN(date),
    MAX(date)
FROM calendar;




-- Step 7: Foreign Key Validation


SELECT
    tc.table_name,
    kcu.column_name,
    ccu.table_name AS referenced_table,
    ccu.column_name AS referenced_column,
    tc.constraint_name
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu
    ON tc.constraint_name = kcu.constraint_name
   AND tc.constraint_schema = kcu.constraint_schema
JOIN information_schema.constraint_column_usage ccu
    ON ccu.constraint_name = tc.constraint_name
   AND ccu.constraint_schema = tc.constraint_schema
WHERE tc.constraint_type = 'FOREIGN KEY'
  AND tc.table_schema = 'public'
ORDER BY tc.table_name, kcu.column_name;



-- Step 8: Orphan Record Validation


SELECT
    COUNT(*) FILTER (
        WHERE p.port_call_id IS NULL
    ) AS missing_port_call,

    COUNT(*) FILTER (
        WHERE r.route_id IS NULL
    ) AS missing_route

FROM ancillary_delivery d
LEFT JOIN port_call p
    ON d.port_call_id = p.port_call_id
LEFT JOIN route_route_change r
    ON d.route_id = r.route_id;





-- Step 9: Port Tax Orphan Validation
-- Purpose: Check port tax records without matching port calls

SELECT
    COUNT(*) FILTER (
        WHERE p.port_call_id IS NULL
    ) AS missing_port_call
FROM port_tax_fee t
LEFT JOIN port_call p
    ON t.port_call_id = p.port_call_id;



-- Step 10: Activity Booking Column Validation
-- Purpose: Inspect columns in activity booking tables

SELECT
    table_name,
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name IN (
      'new_activity_booking',
      'new_activity_booking_backup'
  )
ORDER BY table_name, ordinal_position;




-- Step 11: Activity Booking Orphan Validation


SELECT
    COUNT(*) FILTER (
        WHERE p.passenger_id IS NULL
    ) AS missing_passenger
FROM new_activity_booking a
LEFT JOIN new_passenger p
    ON a.passenger_id = p.passenger_id;



-- Step 12: Activity Booking Date Validation


SELECT
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (
        WHERE booking_date > activity_date
    ) AS booking_after_activity,
    COUNT(*) FILTER (
        WHERE booking_date IS NULL
           OR activity_date IS NULL
    ) AS missing_dates
FROM new_activity_booking;



-- Step 13: Activity Booking Date Issue Sample


SELECT
    activity_booking_id,
    passenger_id,
    activity_name,
    booking_date,
    activity_date,
    booking_status
FROM new_activity_booking
WHERE booking_date > activity_date
ORDER BY activity_booking_id
LIMIT 20;


-- Step 14: Revalidate Activity Booking Dates

SELECT
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (
        WHERE booking_date > activity_date
    ) AS booking_after_activity,
    COUNT(*) FILTER (
        WHERE booking_date IS NULL
           OR activity_date IS NULL
    ) AS missing_dates
FROM new_activity_booking;


-- Step 15: Activity Price Validation


SELECT
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (
        WHERE activity_price < 0
    ) AS negative_prices,
    COUNT(*) FILTER (
        WHERE quantity <= 0
    ) AS invalid_quantities,
    COUNT(*) FILTER (
        WHERE total_price < 0
    ) AS negative_totals,
    COUNT(*) FILTER (
        WHERE total_price IS DISTINCT FROM
              activity_price * quantity
    ) AS total_price_mismatches
FROM new_activity_booking;



-- Step 16: Activity Total Price Mismatch Sample
-- Purpose: Inspect mismatched price calculations before correction

SELECT
    activity_booking_id,
    activity_price,
    quantity,
    total_price,
    activity_price * quantity AS expected_total
FROM new_activity_booking
WHERE total_price IS DISTINCT FROM activity_price * quantity
ORDER BY activity_booking_id
LIMIT 20;


-- Step 17: 

UPDATE new_activity_booking
SET total_price = activity_price * quantity
WHERE total_price IS DISTINCT FROM activity_price * quantity;



-- Step 18: Revalidate Activity Total Prices
-

SELECT
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (
        WHERE total_price IS DISTINCT FROM activity_price * quantity
    ) AS remaining_mismatches
FROM new_activity_booking;


-- Step 19: Activity Booking Status Validation


SELECT
    'booking_status' AS column_name,
    booking_status AS status_value,
    COUNT(*) AS record_count
FROM new_activity_booking
GROUP BY booking_status

UNION ALL

SELECT
    'payment_status',
    payment_status,
    COUNT(*)
FROM new_activity_booking
GROUP BY payment_status
ORDER BY column_name, status_value;



-- Step 20: Booking and Payment Status Consistency


SELECT
    booking_status,
    payment_status,
    COUNT(*) AS record_count
FROM new_activity_booking
GROUP BY booking_status, payment_status
ORDER BY booking_status, payment_status;

-- Step 22: Activity Capacity Validation


SELECT
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE capacity <= 0) AS invalid_capacity,
    COUNT(*) FILTER (WHERE duration_hours <= 0) AS invalid_duration,
    COUNT(*) FILTER (WHERE minimum_age < 0) AS invalid_minimum_age
FROM new_activity_booking;




-- Step 21: Passenger Column Inspection


SELECT
    table_name,
    ordinal_position,
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name IN ('passenger', 'new_passenger')
ORDER BY column_name, table_name;


-- Step 22: New Passenger Data Validation
-- Purpose: Check duplicate IDs and missing passenger details

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT passenger_id) AS unique_passengers,
    COUNT(*) FILTER (
        WHERE passenger_name IS NULL
           OR passenger_name = ''
    ) AS missing_names,
    COUNT(*) FILTER (
        WHERE age IS NULL OR age <= 0
    ) AS invalid_age,
    COUNT(*) FILTER (
        WHERE booking_price IS NULL OR booking_price < 0
    ) AS invalid_booking_price
FROM new_passenger;


-- Step 23: New Passenger Date Validation
-- Purpose: Check booking, travel and disembarkation dates

SELECT
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (
        WHERE booking_date > travel_date
    ) AS booking_after_travel,
    COUNT(*) FILTER (
        WHERE disembarkation_date < travel_date
    ) AS disembarkation_before_travel,
    COUNT(*) FILTER (
        WHERE booking_date IS NULL
           OR travel_date IS NULL
           OR disembarkation_date IS NULL
    ) AS missing_dates
FROM new_passenger;



-- Step 24: New Passenger Status Validation
-- Purpose: Check passenger and booking status values

SELECT
    'passenger_status' AS column_name,
    passenger_status AS status_value,
    COUNT(*) AS record_count
FROM new_passenger
GROUP BY passenger_status

UNION ALL

SELECT
    'booking_status',
    booking_status,
    COUNT(*)
FROM new_passenger
GROUP BY booking_status
ORDER BY column_name, status_value;

-- Step 25: Passenger and Booking Status Consistency
-- Purpose: Find inconsistent passenger and booking statuses

SELECT
    passenger_status,
    booking_status,
    COUNT(*) AS record_count
FROM new_passenger
GROUP BY passenger_status, booking_status
ORDER BY passenger_status, booking_status;


-- Step 26: Passenger Cabin and Cost Validation
-- Purpose: Check cabin capacity and passenger cost values

SELECT
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (
        WHERE cabin_id IS NULL
    ) AS missing_cabin_id,
    COUNT(*) FILTER (
        WHERE cabin_area_sqft <= 0
    ) AS invalid_cabin_area,
    COUNT(*) FILTER (
        WHERE occupancy_capacity <= 0
    ) AS invalid_occupancy_capacity,
    COUNT(*) FILTER (
        WHERE food_cost < 0
    ) AS negative_food_cost,
    COUNT(*) FILTER (
        WHERE nights_booked <= 0
    ) AS invalid_nights_booked
FROM new_passenger;


-- Step 27: Cabin Occupancy Validation
-- Purpose: Identify cabins exceeding their occupancy capacity

SELECT
    cabin_id,
    cabin_number,
    occupancy_capacity,
    COUNT(*) AS passenger_count
FROM new_passenger
WHERE booking_status <> 'Cancelled'
GROUP BY cabin_id, cabin_number, occupancy_capacity
HAVING COUNT(*) > occupancy_capacity
ORDER BY passenger_count DESC;


-- Step 28: Passenger Medical Data Validation
-- Purpose: Check medical records and passenger references

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT passenger_id) AS unique_passengers,
    COUNT(*) FILTER (
        WHERE passenger_id IS NULL
    ) AS missing_passenger_id,
    COUNT(*) FILTER (
        WHERE medical_service_id IS NULL
    ) AS missing_medical_service_id
FROM passenger_medical;



-- Step 29: Passenger Medical Reference Validation
-- Purpose: Find medical records without a matching new_passenger

SELECT COUNT(*) AS missing_passengers
FROM passenger_medical pm
LEFT JOIN new_passenger np
    ON pm.passenger_id = np.passenger_id
WHERE np.passenger_id IS NULL;


-- Step 30: Port Call Duplicate ID Validation
-- Purpose: Check duplicate port_call_id values

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT port_call_id) AS unique_ids,
    COUNT(*) - COUNT(DISTINCT port_call_id) AS duplicate_ids
FROM port_call;



-- Step 31: Port Call Date Validation
-- Purpose: Check arrival and departure date consistency

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'port_call'
ORDER BY ordinal_position;


-- Step 32: Port Call Date and Duration Validation
-- Purpose: Identify invalid arrival/departure times and stay duration

SELECT
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (
        WHERE arrival_time IS NULL
    ) AS missing_arrival,
    COUNT(*) FILTER (
        WHERE departure_time IS NULL
    ) AS missing_departure,
    COUNT(*) FILTER (
        WHERE departure_time < arrival_time
    ) AS departure_before_arrival,
    COUNT(*) FILTER (
        WHERE stay_hours < 0
    ) AS negative_stay_hours,
    COUNT(*) FILTER (
        WHERE weather_delay_hours < 0
    ) AS negative_weather_delay
FROM port_call;


-- Step 33: Actual vs Recorded Stay Hours


SELECT
    port_call_id,
    port_name,
    stay_hours AS recorded_hours,
    ROUND(
        (EXTRACT(EPOCH FROM (departure_time - arrival_time)) / 3600)::numeric,
        2
    ) AS actual_hours
FROM port_call
WHERE stay_hours IS DISTINCT FROM
    ROUND(
        (EXTRACT(EPOCH FROM (departure_time - arrival_time)) / 3600)::numeric,
        2
    )
ORDER BY port_call_id;


-- Step 34: Port Call Reference Validation


SELECT
    COUNT(*) FILTER (
        WHERE r.route_id IS NULL
    ) AS missing_route,
    COUNT(*) FILTER (
        WHERE pd.port_id IS NULL
    ) AS missing_port
FROM port_call pc
LEFT JOIN route_route_change r
    ON pc.route_id = r.route_id
LEFT JOIN port_dimension pd
    ON pc.port_id = pd.port_id;


-- Step 35: Identify Port Call with Missing Route


SELECT
    pc.port_call_id,
    pc.port_name,
    pc.route_id,
    pc.arrival_time,
    pc.departure_time
FROM port_call pc
LEFT JOIN route_route_change r
    ON pc.route_id = r.route_id
WHERE r.route_id IS NULL;


-- Step 36: Available Route IDs


SELECT
    route_id,
    COUNT(*) AS record_count
FROM route_route_change
GROUP BY route_id
ORDER BY route_id;


-- Step 37: Route Details Inspection


SELECT *
FROM route_route_change
ORDER BY route_id;


-- Step 38: Mumbai Route Date Comparison


SELECT
    pc.port_call_id,
    pc.port_name,
    pc.arrival_time AS port_call_arrival,
    r.route_id,
    r.from_port,
    r.to_port,
    r.planned_arrival,
    r.actual_arrival
FROM port_call pc
JOIN route_route_change r
    ON LOWER(r.to_port) = LOWER(pc.port_name)
WHERE pc.port_call_id = 22;


-- Step 39: Mumbai Route and Port Call Sequence Check


SELECT
    pc.port_call_id,
    pc.sequence_no AS port_call_sequence,
    pc.arrival_time AS port_call_arrival,
    r.route_id,
    r.sequence_no AS route_sequence,
    r.planned_arrival,
    r.actual_arrival
FROM port_call pc
LEFT JOIN route_route_change r
    ON pc.route_id = r.route_id
WHERE pc.port_call_id = 22;


-- Step 40: Final Return Route Inspection

SELECT
    route_id,
    sequence_no,
    from_port,
    to_port,
    planned_departure,
    planned_arrival,
    actual_arrival
FROM route_route_change
WHERE sequence_no >= 20
ORDER BY sequence_no;


-- Step 41: Final Port Call Inspection


SELECT
    port_call_id,
    sequence_no,
    port_name,
    arrival_time,
    departure_time,
    route_id
FROM port_call
ORDER BY sequence_no DESC;


-- Step 42: Port Call and Route Mapping Validation

SELECT
    p.port_call_id,
    p.sequence_no AS port_sequence,
    p.port_name,
    p.route_id,
    r.sequence_no AS route_sequence,
    r.from_port,
    r.to_port,
    p.arrival_time,
    r.actual_arrival
FROM port_call p
LEFT JOIN route_route_change r
    ON p.route_id = r.route_id
ORDER BY p.sequence_no;



-- Step 43: Complete Route Sequence Check

SELECT
    route_id,
    sequence_no,
    from_port,
    to_port,
    planned_departure,
    planned_arrival,
    actual_departure,
    actual_arrival
FROM route_route_change
ORDER BY sequence_no;



-- Step 44: Verify Final Port Route Link


SELECT port_call_id, sequence_no, port_name, arrival_time, route_id
FROM port_call
WHERE sequence_no = 21;



-- Step 45: Verify Final Tuticorin Timing
SELECT port_call_id, port_name, arrival_time, departure_time, route_id
FROM port_call
WHERE port_call_id = 22;


-- Step 45: Restore Mumbai as Starting and Ending Port


UPDATE route_route_change
SET from_port = 'Mumbai'
WHERE sequence_no = 1
  AND from_port = 'Tuticorin';

UPDATE route_route_change
SET to_port = 'Mumbai'
WHERE sequence_no = 21
  AND to_port = 'Tuticorin';

UPDATE port_call
SET port_name = 'Mumbai'
WHERE sequence_no IN (1, 21)
  AND port_name = 'Tuticorin';


-- Step 46: Full Itinerary Port and Route Validation


SELECT
    p.sequence_no,
    p.port_name,
    r.from_port,
    r.to_port,
    p.route_id
FROM port_call p
LEFT JOIN route_route_change r
    ON p.route_id = r.route_id
WHERE p.port_name IS DISTINCT FROM r.to_port
ORDER BY p.sequence_no;


-- Step 47 Full Itinerary Port and Route Validation

SELECT
    p.sequence_no,
    p.port_name,
    r.from_port,
    r.to_port,
    p.route_id
FROM port_call p
LEFT JOIN route_route_change r
    ON p.route_id = r.route_id
WHERE p.port_name IS DISTINCT FROM r.to_port
ORDER BY p.sequence_no;


-- Step 48: Validate Consecutive Route Connections


WITH route_check AS (
    SELECT
        sequence_no,
        from_port,
        to_port,
        LEAD(from_port) OVER (ORDER BY sequence_no) AS next_from_port
    FROM route_route_change
)
SELECT
    sequence_no,
    from_port,
    to_port,
    next_from_port
FROM route_check
WHERE next_from_port IS NOT NULL
  AND to_port IS DISTINCT FROM next_from_port
ORDER BY sequence_no;



-- Step 49: Route Date Validation


SELECT
    route_id,
    sequence_no,
    from_port,
    to_port,
    planned_departure,
    planned_arrival,
    actual_departure,
    actual_arrival
FROM route_route_change
WHERE planned_departure >= planned_arrival
   OR actual_departure >= actual_arrival
   OR actual_departure IS NULL
   OR actual_arrival IS NULL
ORDER BY sequence_no;



-- Step 50: Route Distance and Fuel Validation


SELECT
    route_id,
    sequence_no,
    from_port,
    to_port,
    distance_nm,
    estimated_speed_knots,
    fuel_consumption_mt,
    fuel_cost
FROM route_route_change
WHERE distance_nm <= 0
   OR estimated_speed_knots <= 0
   OR fuel_consumption_mt < 0
   OR fuel_cost < 0
ORDER BY sequence_no;


-- Step 51: Port Call Data Validation


SELECT
    port_call_id,
    port_name,
    port_fee,
    passenger_embarkation,
    passenger_disembarkation,
    latitude,
    longitude
FROM port_call
WHERE port_fee < 0
   OR passenger_embarkation < 0
   OR passenger_disembarkation < 0
   OR latitude NOT BETWEEN -90 AND 90
   OR longitude NOT BETWEEN -180 AND 180
ORDER BY sequence_no;


-- Step 52: Port Call Duplicate Validation


SELECT
    sequence_no,
    COUNT(*) AS record_count
FROM port_call
GROUP BY sequence_no
HAVING COUNT(*) > 1
ORDER BY sequence_no;


-- Step 60: Inspect Duplicate Port Sequence 12
-- Purpose: Identify both records before correcting sequence numbers

SELECT
    port_call_id,
    sequence_no,
    port_name,
    arrival_time,
    departure_time,
    route_id
FROM port_call
WHERE sequence_no = 12
ORDER BY port_call_id;


-- Step 53: Correct Port Call Sequence After Manaus


BEGIN;

UPDATE port_call
SET sequence_no = 100
WHERE port_call_id = 21
  AND port_name = 'Manaus'
  AND sequence_no = 12;

UPDATE port_call
SET sequence_no = sequence_no + 1
WHERE sequence_no BETWEEN 13 AND 20;

UPDATE port_call
SET sequence_no = 13
WHERE port_call_id = 21
  AND port_name = 'Manaus'
  AND sequence_no = 100;

COMMIT;


-- Step 54: Verify Port Call Sequence


SELECT
    sequence_no,
    port_name,
    arrival_time,
    departure_time,
    route_id
FROM port_call
ORDER BY sequence_no;


-- Step 55: Fix Final Port Sequence Numbers


BEGIN;

UPDATE port_call
SET sequence_no = 22
WHERE port_name = 'Mumbai'
  AND arrival_time = TIMESTAMP '2025-11-25 08:00:00'
  AND sequence_no = 21;

COMMIT;



-- Step 56: Final Port Sequence Verification

SELECT sequence_no, COUNT(*) AS record_count
FROM port_call
GROUP BY sequence_no
HAVING COUNT(*) > 1
ORDER BY sequence_no;


-- Step 57: Port Arrival Date Order Validation

WITH port_dates AS (
    SELECT
        sequence_no,
        port_name,
        arrival_time,
        LAG(arrival_time) OVER (ORDER BY sequence_no) AS previous_arrival
    FROM port_call
)
SELECT
    sequence_no,
    port_name,
    previous_arrival,
    arrival_time
FROM port_dates
WHERE arrival_time < previous_arrival
ORDER BY sequence_no;


-- Step 58: Correct Cape Town Port Call Dates


UPDATE port_call
SET
    arrival_time = TIMESTAMP '2025-08-25 08:00:00',
    departure_time = TIMESTAMP '2025-08-29 18:00:00',
    arrival_date = DATE '2025-08-25'
WHERE port_name = 'Cape Town'
  AND route_id = 13;


-- Step 59: Correct Durban Port Call Dates


UPDATE port_call
SET
    arrival_time = TIMESTAMP '2025-09-02 08:00:00',
    departure_time = TIMESTAMP '2025-09-06 18:00:00',
    arrival_date = DATE '2025-09-02'
WHERE port_name = 'Durban'
  AND route_id = 14;

-- Step 60: Correct Sydney Port Call Dates


UPDATE port_call
SET
    arrival_time = TIMESTAMP '2025-09-18 08:00:00',
    departure_time = TIMESTAMP '2025-09-22 18:00:00',
    arrival_date = DATE '2025-09-18'
WHERE port_name = 'Sydney'
  AND route_id = 15;



-- Step 61: Final Port Call Review


SELECT
    sequence_no,
    port_call_id,
    port_name,
    arrival_time,
    departure_time,
    route_id
FROM port_call
ORDER BY sequence_no;



-- Step 62: Compare Port Call and Route Arrival Dates


SELECT
    p.sequence_no,
    p.port_name,
    p.arrival_time AS port_arrival,
    r.to_port AS route_destination,
    r.planned_arrival,
    r.actual_arrival
FROM port_call p
JOIN route_route_change r
    ON p.route_id = r.route_id
ORDER BY p.sequence_no;


-- Step 63: Inspect Routes 12–14


SELECT
    route_id,
    sequence_no,
    from_port,
    to_port,
    planned_departure,
    planned_arrival,
    actual_departure,
    actual_arrival
FROM route_route_change
WHERE sequence_no BETWEEN 12 AND 14
ORDER BY sequence_no;



-- Step 64: Check Manaus port_call mapping (SELECT only)

SELECT
    port_call_id,
    sequence_no,
    port_name,
    route_id,
    arrival_time,
    departure_time
FROM port_call
WHERE port_name IN ('Buenos Aires', 'Manaus', 'Cape Town', 'Durban')
ORDER BY sequence_no;



-- Step 65: Audit all port_call and route mappings (SELECT only)

SELECT
    p.sequence_no,
    p.port_name,
    p.route_id AS current_route_id,
    r.sequence_no AS route_sequence,
    r.from_port,
    r.to_port
FROM port_call p
LEFT JOIN route_route_change r
    ON p.route_id = r.route_id
ORDER BY p.sequence_no;


-- Step 66: Check foreign-key references before changing route_id

SELECT
    tc.table_name,
    kcu.column_name,
    ccu.table_name AS referenced_table,
    ccu.column_name AS referenced_column
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu
    ON tc.constraint_name = kcu.constraint_name
   AND tc.constraint_schema = kcu.constraint_schema
JOIN information_schema.constraint_column_usage ccu
    ON ccu.constraint_name = tc.constraint_name
   AND ccu.constraint_schema = tc.constraint_schema
WHERE tc.constraint_type = 'FOREIGN KEY'
  AND ccu.table_name = 'route_route_change'
ORDER BY tc.table_name;


-- Step 67: Preview proposed port_call route_id corrections

SELECT
    p.port_call_id,
    p.sequence_no,
    p.port_name,
    p.route_id AS current_route_id,
    p.sequence_no AS proposed_route_id,
    r.from_port,
    r.to_port
FROM port_call p
LEFT JOIN route_route_change r
    ON r.route_id = p.sequence_no
WHERE p.sequence_no BETWEEN 13 AND 22
ORDER BY p.sequence_no;


-- Step 68: Check final Mumbai route mapping (SELECT only)

SELECT
    port_call_id,
    sequence_no,
    port_name,
    route_id
FROM port_call
WHERE sequence_no >= 20
ORDER BY sequence_no;


-- Step 69: Verify current route mapping after the failed update

SELECT
    p.sequence_no,
    p.port_name,
    p.route_id,
    r.from_port,
    r.to_port
FROM port_call p
LEFT JOIN route_route_change r
    ON p.route_id = r.route_id
WHERE p.sequence_no BETWEEN 13 AND 22
ORDER BY p.sequence_no;


-- Step 70: Check port_call route_id column definition and constraints

SELECT
    column_name,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_name = 'port_call'
  AND column_name = 'route_id';

SELECT
    conname,
    pg_get_constraintdef(oid) AS constraint_definition
FROM pg_constraint
WHERE conrelid = 'port_call'::regclass
  AND contype = 'f';


-- Step 71: Check route count and IDs

SELECT
    MIN(route_id) AS min_route_id,
    MAX(route_id) AS max_route_id,
    COUNT(*) AS total_routes
FROM route_route_change;


-- Step 72: Correct Manaus route mapping only

UPDATE port_call
SET route_id = 13
WHERE sequence_no = 13
  AND port_name = 'Manaus'
  AND route_id = 12;


-- Step 73: Verify Manaus mapping

SELECT
    p.sequence_no,
    p.port_name,
    p.route_id,
    r.from_port,
    r.to_port
FROM port_call p
JOIN route_route_change r
    ON p.route_id = r.route_id
WHERE p.sequence_no BETWEEN 12 AND 14
ORDER BY p.sequence_no;


-- Step 74: Correct Durban route mapping only

UPDATE port_call
SET route_id = 15
WHERE sequence_no = 15
  AND port_name = 'Durban'
  AND route_id = 14;


-- Step 78: Verify route mapping for sequences 14–16

SELECT
    p.sequence_no,
    p.port_name,
    p.route_id,
    r.from_port,
    r.to_port
FROM port_call p
JOIN route_route_change r
    ON p.route_id = r.route_id
WHERE p.sequence_no BETWEEN 14 AND 16
ORDER BY p.sequence_no;



-- Step 79: Check port-call date sequence

WITH ordered_ports AS (
    SELECT
        sequence_no,
        port_name,
        arrival_time,
        departure_time,
        LAG(departure_time) OVER (
            ORDER BY sequence_no
        ) AS previous_departure
    FROM port_call
)
SELECT
    sequence_no,
    port_name,
    previous_departure,
    arrival_time,
    CASE
        WHEN arrival_time < previous_departure
            THEN 'Check date order'
        ELSE 'OK'
    END AS date_check
FROM ordered_ports
WHERE previous_departure IS NOT NULL
ORDER BY sequence_no;



-- Step 80: Complete Port & Route Audit (22 ports, 21 routes)

WITH audit AS (
    SELECT
        p.port_call_id,
        p.sequence_no,
        p.port_name,
        p.route_id,
        p.arrival_time,
        p.departure_time,
        p.arrival_date,
        p.stay_hours,
        r.from_port,
        r.to_port,
        r.actual_departure AS route_actual_departure,
        r.actual_arrival AS route_actual_arrival,
        prev.actual_arrival AS incoming_actual_arrival,
        prev.to_port AS incoming_destination
    FROM port_call p
    LEFT JOIN route_route_change r
        ON r.route_id = p.route_id
    LEFT JOIN route_route_change prev
        ON prev.sequence_no = p.sequence_no - 1
)
SELECT
    sequence_no,
    port_name,
    route_id,
    arrival_time,
    departure_time,

    CASE
        WHEN from_port = port_name THEN 'Origin mapping OK'
        WHEN to_port = port_name AND sequence_no = 22
            THEN 'Final destination OK'
        ELSE 'CHECK ROUTE MAPPING'
    END AS route_mapping_check,

    incoming_actual_arrival,
    CASE
        WHEN sequence_no = 1 THEN 'Starting port'
        WHEN incoming_destination <> port_name
            THEN 'CHECK INCOMING PORT'
        WHEN arrival_time::date < incoming_actual_arrival::date
            THEN 'ARRIVAL BEFORE ROUTE ARRIVAL'
        ELSE 'Check actual vs scheduled'
    END AS incoming_date_check,

    CASE
        WHEN arrival_time >= departure_time
            THEN 'CHECK PORT TIMES'
        WHEN arrival_date IS DISTINCT FROM arrival_time::date
            THEN 'CHECK ARRIVAL DATE'
        ELSE 'OK'
    END AS port_time_check,

    CASE
        WHEN route_actual_departure IS NULL
          OR route_actual_arrival IS NULL
            THEN 'MISSING ROUTE TIME'
        WHEN route_actual_departure >= route_actual_arrival
            THEN 'INVALID ROUTE TIMES'
        ELSE 'OK'
    END AS route_time_check

FROM audit
ORDER BY sequence_no;



-- Step 81: Correct Honolulu, Los Angeles and Vancouver port-call dates


UPDATE port_call p
SET
    arrival_time = r.actual_arrival,
    arrival_date = r.actual_arrival::date,
    departure_time = next_route.actual_departure
FROM route_route_change r
JOIN route_route_change next_route
    ON next_route.route_id = r.route_id + 1
WHERE p.route_id = r.route_id + 1
  AND p.port_name = r.to_port
  AND p.port_name IN ('Honolulu', 'Los Angeles', 'Vancouver')
  AND r.route_id IN (17, 18, 19);



-- Step 82: Fix final Mumbai arrival_date

UPDATE port_call
SET arrival_date = arrival_time::date
WHERE sequence_no = 22
  AND port_name = 'Mumbai'
  AND arrival_date IS NULL;


-- Step 83: Verify final Mumbai arrival date

SELECT
    sequence_no,
    port_name,
    arrival_time,
    arrival_date,
    CASE
        WHEN arrival_date = arrival_time::date THEN 'OK'
        ELSE 'CHECK'
    END AS audit_status
FROM port_call
WHERE sequence_no = 22;



-- Step 84: Final Cruise Route and Port Date Audit

SELECT
    p.sequence_no,
    p.port_name,
    p.arrival_time,
    p.departure_time,
    p.arrival_date,
    r.from_port,
    r.to_port,
    r.actual_arrival,
    r.actual_departure,
    CASE
        WHEN p.arrival_date IS DISTINCT FROM p.arrival_time::date
            THEN 'CHECK ARRIVAL DATE'
        WHEN p.sequence_no BETWEEN 2 AND 22
             AND p.arrival_time < (
                 SELECT prev.actual_arrival
                 FROM route_route_change prev
                 WHERE prev.route_id = p.sequence_no - 1
             )
            THEN 'CHECK ROUTE ARRIVAL'
        WHEN p.sequence_no BETWEEN 1 AND 21
             AND p.departure_time > r.actual_departure
            THEN 'CHECK DEPARTURE'
        ELSE 'OK'
    END AS audit_status
FROM port_call p
LEFT JOIN route_route_change r
    ON r.route_id = CASE
        WHEN p.sequence_no = 22 THEN 21
        ELSE p.sequence_no
    END
ORDER BY p.sequence_no;



-- Step 85: Calculate route vs port-call arrival differences

SELECT
    p.sequence_no,
    p.port_name,
    p.arrival_time AS port_arrival,
    prev.actual_arrival AS route_actual_arrival,
    ROUND(
        (EXTRACT(EPOCH FROM
            (p.arrival_time - prev.actual_arrival)
        ) / 60)::numeric,
        0
    ) AS difference_minutes,
    CASE
        WHEN p.arrival_time = prev.actual_arrival THEN 'EXACT MATCH'
        WHEN ABS(EXTRACT(EPOCH FROM
            (p.arrival_time - prev.actual_arrival)
        )) <= 1800 THEN 'WITHIN 30 MIN'
        ELSE 'REVIEW'
    END AS audit_status
FROM port_call p
JOIN route_route_change prev
    ON prev.route_id = p.sequence_no - 1
WHERE p.sequence_no BETWEEN 2 AND 22
ORDER BY p.sequence_no;


-- Step 86: Align 5 port-call arrival times with planned arrival


UPDATE port_call p
SET
    arrival_time = r.planned_arrival,
    arrival_date = r.planned_arrival::date
FROM route_route_change r
WHERE r.route_id = p.sequence_no - 1
  AND p.sequence_no IN (4, 5, 6, 7, 13)
  AND p.arrival_time IS DISTINCT FROM r.planned_arrival;


-- Step 87: Verify the 5 port-call arrival times

SELECT
    p.sequence_no,
    p.port_name,
    p.arrival_time,
    r.planned_arrival,
    p.arrival_date,
    CASE
        WHEN p.arrival_time = r.planned_arrival
         AND p.arrival_date = r.planned_arrival::date
        THEN 'OK'
        ELSE 'CHECK'
    END AS audit_status
FROM port_call p
JOIN route_route_change r
    ON r.route_id = p.sequence_no - 1
WHERE p.sequence_no IN (4, 5, 6, 7, 13)
ORDER BY p.sequence_no;



-- Step 88: Final Port Call Date Audit

SELECT
    COUNT(*) AS total_port_calls,
    COUNT(*) FILTER (
        WHERE arrival_date = arrival_time::date
    ) AS arrival_dates_ok,
    COUNT(*) FILTER (
        WHERE arrival_time < departure_time
    ) AS valid_port_stays,
    COUNT(*) FILTER (
        WHERE arrival_date IS DISTINCT FROM arrival_time::date
           OR arrival_time >= departure_time
    ) AS issues_found
FROM port_call;


-- Step 89: Final Route Chain Audit

WITH route_audit AS (
    SELECT
        route_id,
        from_port,
        to_port,
        planned_departure,
        planned_arrival,
        actual_departure,
        actual_arrival,
        LEAD(from_port) OVER (ORDER BY route_id) AS next_from_port,
        LEAD(planned_departure) OVER (ORDER BY route_id) AS next_departure
    FROM route_route_change
)
SELECT
    COUNT(*) AS total_routes,
    COUNT(*) FILTER (
        WHERE planned_departure < planned_arrival
          AND actual_departure < actual_arrival
    ) AS valid_route_times,
    COUNT(*) FILTER (
        WHERE next_from_port IS NULL OR to_port = next_from_port
    ) AS route_chain_ok,
    COUNT(*) FILTER (
        WHERE planned_departure >= planned_arrival
           OR actual_departure >= actual_arrival
           OR (next_from_port IS NOT NULL AND to_port <> next_from_port)
    ) AS issues_found
FROM route_audit;


-- Step 90: Final Route Chain Audit

WITH route_audit AS (
    SELECT
        route_id,
        from_port,
        to_port,
        planned_departure,
        planned_arrival,
        actual_departure,
        actual_arrival,
        LEAD(from_port) OVER (ORDER BY route_id) AS next_from_port,
        LEAD(planned_departure) OVER (ORDER BY route_id) AS next_departure
    FROM route_route_change
)
SELECT
    COUNT(*) AS total_routes,
    COUNT(*) FILTER (
        WHERE planned_departure < planned_arrival
          AND actual_departure < actual_arrival
    ) AS valid_route_times,
    COUNT(*) FILTER (
        WHERE next_from_port IS NULL OR to_port = next_from_port
    ) AS route_chain_ok,
    COUNT(*) FILTER (
        WHERE planned_departure >= planned_arrival
           OR actual_departure >= actual_arrival
           OR (next_from_port IS NOT NULL AND to_port <> next_from_port)
    ) AS issues_found
FROM route_audit;


-- Step 91: Core Cruise Tables Integrity Audit

SELECT
    'new_passenger' AS table_name,
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE passenger_id IS NULL) AS null_ids,
    COUNT(DISTINCT passenger_id) AS unique_ids
FROM new_passenger

UNION ALL

SELECT
    'new_activity_booking',
    COUNT(*),
    COUNT(*) FILTER (WHERE activity_booking_id IS NULL),
    COUNT(DISTINCT activity_booking_id)
FROM new_activity_booking

UNION ALL

SELECT
    'new_food',
    COUNT(*),
    COUNT(*) FILTER (WHERE food_transaction_id IS NULL),
    COUNT(DISTINCT food_transaction_id)
FROM new_food

UNION ALL

SELECT
    'staff',
    COUNT(*),
    COUNT(*) FILTER (WHERE staff_id IS NULL),
    COUNT(DISTINCT staff_id)
FROM staff

UNION ALL

SELECT
    'staff_monthly_salary',
    COUNT(*),
    COUNT(*) FILTER (
        WHERE staff_id IS NULL OR salary_date IS NULL
    ),
    COUNT(DISTINCT (staff_id, salary_date))
FROM staff_monthly_salary;



-- Step 92: Activity Booking Integrity Audit

SELECT
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE passenger_id IS NULL) AS null_passenger_ids,
    COUNT(*) FILTER (
        WHERE passenger_id IS NOT NULL
          AND NOT EXISTS (
              SELECT 1
              FROM new_passenger p
              WHERE p.passenger_id = b.passenger_id
          )
    ) AS unmatched_passenger_ids,
    COUNT(*) FILTER (
        WHERE booking_date > activity_date
    ) AS booking_after_activity,
    COUNT(*) FILTER (
        WHERE total_price IS DISTINCT FROM
              activity_price * quantity
    ) AS price_mismatches
FROM new_activity_booking b;




-- Step 93: Food Revenue and Inventory Audit

SELECT
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (
        WHERE opening_quantity + received_quantity
              <> sold_quantity + waste_quantity + closing_quantity
    ) AS inventory_mismatches,
    COUNT(*) FILTER (
        WHERE gross_revenue <> sold_quantity * unit_price
    ) AS gross_revenue_mismatches,
    COUNT(*) FILTER (
        WHERE net_revenue <> gross_revenue - discount_amount
    ) AS net_revenue_mismatches,
    COUNT(*) FILTER (
        WHERE profit <> net_revenue - food_cost
    ) AS profit_mismatches,
    COUNT(*) FILTER (
        WHERE transaction_date IS NULL
    ) AS missing_dates
FROM new_food;


-- Step 127: Passenger Data Integrity Audit

SELECT
    COUNT(*) AS total_passengers,
    COUNT(*) FILTER (
        WHERE booking_date > travel_date
    ) AS booking_date_issues,
    COUNT(*) FILTER (
        WHERE travel_date > disembarkation_date
    ) AS travel_date_issues,
    COUNT(*) FILTER (
        WHERE age <= 0 OR booking_price < 0
    ) AS invalid_age_or_price,
    COUNT(*) FILTER (
        WHERE passenger_id IS NULL
           OR passenger_name IS NULL
    ) AS missing_required_data
FROM new_passenger;


-- Step 128: Core Foreign-Key Reference Audit

SELECT
    'activity_booking -> passenger' AS relationship,
    COUNT(*) AS unmatched_rows
FROM new_activity_booking b
WHERE NOT EXISTS (
    SELECT 1
    FROM new_passenger p
    WHERE p.passenger_id = b.passenger_id
)

UNION ALL

SELECT
    'activity_booking -> port',
    COUNT(*)
FROM new_activity_booking b
WHERE b.port_id IS NOT NULL
  AND NOT EXISTS (
      SELECT 1
      FROM port_dimension p
      WHERE p.port_id = b.port_id
  )

UNION ALL

SELECT
    'new_food -> port',
    COUNT(*)
FROM new_food f
WHERE f.port_id IS NOT NULL
  AND NOT EXISTS (
      SELECT 1
      FROM port_dimension p
      WHERE p.port_id = f.port_id
  )

UNION ALL

SELECT
    'salary -> staff',
    COUNT(*)
FROM staff_monthly_salary s
WHERE NOT EXISTS (
    SELECT 1
    FROM staff st
    WHERE st.staff_id = s.staff_id
);


-- Step 129: Weather Climate Data Audit

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT weather_climate_id) AS unique_ids,
    COUNT(*) FILTER (
        WHERE weather_climate_id IS NULL
    ) AS null_ids,
    COUNT(*) FILTER (
        WHERE port_call_id IS NULL
    ) AS null_port_call_ids,
    COUNT(*) FILTER (
        WHERE NOT EXISTS (
            SELECT 1
            FROM port_call pc
            WHERE pc.port_call_id = wc.port_call_id
        )
    ) AS unmatched_port_calls
FROM weather_climate wc;



