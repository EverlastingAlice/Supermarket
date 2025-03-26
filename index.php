<?php
// Подключение к БД
$host = 'localhost';
$dbname = 'supermarket';
$user = 'root';
$pass = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Connection error: " . $e->getMessage());
}

// SQL-запрос с учетом реальных названий полей
$query = "
    SELECT 
        s.Date_of_sale,
        p.Name AS Product,
        m.Name AS Manufacturer,
        c.Name AS Category,
        s.Count AS Quantity,
        s.Full_price,
        cu.Name AS Customer,
        cu.Discount,
        sm.Name AS Salesman,
        sm.Phone_number
    FROM Sales s
    JOIN Product p ON s.Product_id = p.ID
    JOIN Manufacturer m ON p.Manufacturer_id = m.ID
    JOIN Category c ON p.Category_id = c.ID
    JOIN Customer cu ON s.Customer_id = cu.ID
    JOIN Salesman sm ON s.Salesman_id = sm.ID
";

$stmt = $pdo->query($query);
$sales = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Учет продаж</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            line-height: 1.6;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 2rem 0;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: #f8f9fa;
            font-weight: 600;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .header {
            text-align: center;
            margin-bottom: 3rem;
        }
        .price {
            font-weight: bold;
            color: #2c3e50;
        }
        .quantity {
            color: #3498db;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Учет продаж</h1>
        </div>
        
        <table>
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Product</th>
                    <th>Manufacturer</th>
                    <th>Category</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Customer</th>
                    <th>Discount</th>
                    <th>Salesman</th>
                    <th>Contact</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($sales as $sale): ?>
                <tr>
                    <td><?= date('d M Y', strtotime($sale['Date_of_sale'])) ?></td>
                    <td><?= htmlspecialchars($sale['Product']) ?></td>
                    <td><?= htmlspecialchars($sale['Manufacturer']) ?></td>
                    <td><?= htmlspecialchars($sale['Category']) ?></td>
                    <td class="quantity"><?= $sale['Quantity'] ?></td>
                    <td class="price"><?= number_format($sale['Full_price'], 2). ' руб' ?></td>
                    <td><?= htmlspecialchars($sale['Customer']) ?></td>
                    <td><?= $sale['Discount'] ?>%</td>
                    <td><?= htmlspecialchars($sale['Salesman']) ?></td>
                    <td><?= htmlspecialchars($sale['Phone_number']) ?></td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</body>
</html>