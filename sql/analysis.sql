-- Total inventory by value
SELECT 
    item_name,
    on_hand,
    unit_cost,
    on_hand * unit_cost AS total_val
FROM inventory
ORDER BY total_val DESC;

-- Packaging usage per shipment
SELECT
    m.shipment_id,
    m.item_name,
    SUM(m.quantity_used) AS total_used
FROM materials_usage m
GROUP BY m.shipment_id, m.item_name
ORDER BY m.shipment_id, m.item_name;

-- Shipments with dry ice
SELECT
    m.shipment_id,
    SUM(quantity_used) AS total_dry_ice
FROM materials_usage
WHERE item_name = 'Dry Ice Pack'
GROUP BY shipment_id
HAVING total_dry_ice > 20;

-- Packaging cost by shipment
SELECT
    s.shipment_id,
    s.customer,
    s.total_val,
    SUM(m.quantity_used * i.uint_cost) AS materials_cost
FROM shipment s
JOIN materials_usage m
    ON s.shipment_id = m.shipment_id
JOIN inventory i
    ON m.item_name = i.item_name
GROUP BY s.shipment_id, s.customer, s.total_value
ORDER BY materials_cost DESC;