<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Media extends Model
{
    use HasFactory;
    
    protected $table   = 'media';
    protected $guarded = [];



    /** start relations **/
    public function mediable()
    {
        return $this->morphTo();
    }
    /** end relations **/
}
