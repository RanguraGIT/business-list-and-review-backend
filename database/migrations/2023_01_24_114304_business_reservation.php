<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('business_reservations', function (Blueprint $table) {
            $table->id('reservation_id');
            $table->bigInteger('reservation_business')->foreign()->constrained('businesses')->onDelete('cascade');
            $table->bigInteger('reservation_user')->foreign()->constrained('users')->onDelete('cascade');
            $table->integer('reservation_person');
            $table->date('reservation_date');
            $table->time('reservation_time');
            $table->text('reservation_message')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('business_reservations');
    }
};
