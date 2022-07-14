<?php
require_once __DIR__ . "/Cinema.php";
$cinema = new Cinema();
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Lab1</title>
</head>
<body style="display: flex">
<div>
    <form action="" method="post">
        <label> Genre:
            <input type="text" name="genre">
        </label>
        <input type="submit"><br>
    </form>
    <form action="" method="post">
        <label> Actor:
            <input type="text" name="actor">
        </label>
        <input type="submit"><br>
    </form>
    <form action="" method="post">
        <label> Date Start:
            <input type="date" name="start">
        </label>
        <label> Date End:
            <input type="date" name="end">
        </label>
        <input type="submit"><br>
    </form>
</div>
<div>
    <?php
    if (isset($_POST["start"])) {
        $cinema->datePeriod($_POST["start"], $_POST["end"]);
    } else if (isset($_POST["genre"])) {
        $cinema->genre($_POST["genre"]);
    } else if (isset($_POST["actor"])) {
        $cinema->actor($_POST["actor"]);
    }
    ?>
</div>
</body>
</html>
