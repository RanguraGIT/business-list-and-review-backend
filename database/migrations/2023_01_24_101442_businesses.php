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
        Schema::create('businesses', function (Blueprint $table) {
            $table->id('business_id');
            $table->string('business_name', 100);
            $table->string('business_type', 20);
            $table->text('business_category');
            $table->string('business_email', 100);
            $table->string('business_phone', 20);
            $table->string('business_website', 100);
            $table->enum('business_price', [1, 2, 3, 4]);
            $table->string('business_opening', 6);
            $table->string('business_closing', 6);
            $table->string('business_country', 20)->nullable();
            $table->string('business_state', 20)->nullable();
            $table->string('business_city', 20)->nullable();
            $table->text('business_address');
            $table->string('business_zip', 10)->nullable();
            $table->float('business_latitute', 10, 9);
            $table->float('business_longitude', 10, 9);
            $table->boolean('business_status')->default(1);
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
        Schema::dropIfExists('businesses');
    }
};
