<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBiddingsTable extends Migration
{
    public function up()
    {
        Schema::create('biddings', function (Blueprint $table) {
            $table->id();
            $table->foreignId('sender_id')->constrained('users')->onDelete('cascade');  // the user placing the bid
            $table->foreignId('receiver_id')->constrained('users')->onDelete('cascade'); // the user receiving the bid
            // bid status: integer
            $table->integer('bid');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('biddings');
    }
}
