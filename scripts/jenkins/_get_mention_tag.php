<?php

$github_username = $argv[1];

$json = file_get_contents(__DIR__ . '/chatwork_members.json');
$master = json_decode($json, true);

$suffix = $master['suffix'];
$user_map = $master['users'];

if (isset($user_map[$github_username])) {
    $user = $user_map[$github_username];
    echo "[To:{$user['aid']}] {$user['name']} {$suffix}";
    return;
}

echo '';
return;
