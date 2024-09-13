<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('contents', function (Blueprint $table) {
            //tables for house model
            $table->id();
            $table->enum('type', ['house', 'apartment']);
            $table->enum('availability', ['available', 'not available']);
            $table->string('address');
            $table->string('city');
            $table->string('state');
            $table->string('zip');
            $table->decimal('price', 10, 2);
            $table->longText('description')->nullable();
            $table->integer('m2')->unsigned();
            $table->integer('bedrooms')->unsigned();
            $table->integer('bathrooms')->unsigned();
            $table->string('image');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('content');
    }
};
