<?php

namespace Yiche\TableShard;

use Illuminate\Support\ServiceProvider;

class TableShardServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
        $this->commands([
            TableShardInstall::class
        ]);
    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register()
    {

    }
}
