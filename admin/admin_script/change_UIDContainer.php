<?php
$value = $_POST['value'];
$file = 'UIDContainer.php';

$currentValue = file_get_contents($file); // Get the current contents of UIDContainer.php

// Check if the current value is already 0
if (trim($currentValue) !== '0') {
    // Read the existing contents of the file
    $contents = file_get_contents($file);

    // Replace the first line with the new value
    $newContents = preg_replace('/^.*/m', $value, $contents, 1);

    // Write the modified contents back to the file
    file_put_contents($file, $newContents);
}

?>



