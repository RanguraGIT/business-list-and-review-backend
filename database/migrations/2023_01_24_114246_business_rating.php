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
        Schema::create('business_ratings', function (Blueprint $table) {
            $table->id('rating_id');
            $table->bigInteger('rating_business')->foreign()->constrained('businesses')->onDelete('cascade');
            $table->bigInteger('rating_user')->foreign()->constrained('users')->onDelete('cascade');
            $table->float('rating', 2, 1);
            $table->text('rating_review');
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
        Schema::dropIfExists('business_ratings');
    }
};
