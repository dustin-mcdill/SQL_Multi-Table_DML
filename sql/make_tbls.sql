CREATE TABLE inventory(
    item_id INTEGER,
    item_name TEXT,
    category TEXT,
    unit_cost REAL,
    on_hand INTEGER
);

CREATE TABLE shipments (
    shipment_id INTEGER,
    shipment_date TEXT,
    customer TEXT,
    items_shipped INTEGER,
    total_val REAL
);

CREATE TABLE materials_usage (
    usage_id INTEGER,
    shipment_id INTEGER,
    item_name TEXT,
    quantity_used INTEGER
);