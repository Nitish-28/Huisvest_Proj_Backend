<?php

return [
    'paths' => ['api/*'], // Adjust this to match your API routes
    'allowed_methods' => ['*'], // Allow all methods or specify which ones
    'allowed_origins' => ['*'], // Add the appropriate URLs
    'allowed_origins_patterns' => [],
    'allowed_headers' => ['*'], // Allow all headers or specify which ones
    'exposed_headers' => [],
    'max_age' => 0,
    'supports_credentials' => true,
];
