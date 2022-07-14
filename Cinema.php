<?php

class Cinema
{
    private PDO $db;

    public function __construct()
    {
        $this->db = new PDO("mysql:host=127.0.0.1;dbname=films", "root", "");
    }

    public function genre($genre): void
    {
        $statement = $this->db->prepare("SELECT name, `date`, country, quality, carrier FROM film INNER JOIN film_genre ON ID_Film = FID_Film INNER JOIN genre ON FID_Genre = ID_Genre WHERE title = ?");
        $statement->execute([$genre]);
        echo "<table>";
        echo " <tr>
     <th> Title  </th>
     <th> Release  Date </th>
     <th> Country </th>
     <th> Quality </th>
     <th> Carrier </th>
    </tr> ";
        while ($data = $statement->fetch()) {
            echo " <tr>
         <td> {$data['name']}  </td>
         <td> {$data['date']} </td>
         <td> {$data['country']} </td>
         <td> {$data['quality']} </td>
         <td> {$data['carrier']} </td>
        </tr> ";
        }
        echo "</table>";
    }

    public function actor($actor): void
    {
        $statement = $this->db->prepare("SELECT film.name as 'name', `date`, country, quality, carrier 
    FROM film INNER JOIN film_actor ON ID_Film = FID_Film 
    INNER JOIN actor ON FID_Actor = ID_Actor
    WHERE actor.name = ?");
        $statement->execute([$actor]);
        echo "<table>";
        echo " <tr>
     <th> Title  </th>
     <th> Release  Date </th>
     <th> Country </th>
     <th> Quality </th>
     <th> Carrier </th>
    </tr> ";
        while ($data = $statement->fetch()) {
            echo " <tr>
         <td> {$data['name']}  </td>
         <td> {$data['date']} </td>
         <td> {$data['country']} </td>
         <td> {$data['quality']} </td>
         <td> {$data['carrier']} </td>
        </tr> ";
        }
        echo "</table>";
    }

    public function datePeriod($start, $end): void
    {
        $statement = $this->db->prepare("SELECT name, `date`, country, quality, carrier FROM film WHERE `date` BETWEEN ? AND ?");
        $statement->execute([$start, $end]);
        echo "<table>";
        echo " <tr>
     <th> Title  </th>
     <th> Release  Date </th>
     <th> Country </th>
     <th> Quality </th>
     <th> Carrier </th>
    </tr> ";
        while ($data = $statement->fetch()) {
            echo " <tr>
         <td> {$data['name']}  </td>
         <td> {$data['date']} </td>
         <td> {$data['country']} </td>
         <td> {$data['quality']} </td>
         <td> {$data['carrier']} </td>
        </tr> ";
        }
        echo "</table>";
    }
}