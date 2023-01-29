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
        Schema::create('users', function (Blueprint $table) {
            $table->id('user_id');
            $table->string('user_name', 100);
            $table->string('user_username', 20)->unique()->nullable();
            $table->string('user_email', 100)->unique();
            $table->string('user_phone', 20)->unique()->nullable();
            $table->string('user_password', 100);
            $table->string('user_country', 20)->nullable();
            $table->string('user_state', 20)->nullable();
            $table->string('user_city', 20)->nullable();
            $table->text('user_address')->nullable();
            $table->string('user_zip', 10)->nullable();
            $table->boolean('user_status')->default(1);
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
        Schema::dropIfExists('users');
    }
};
