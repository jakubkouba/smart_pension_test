# SmartPensionTest

## Installation

Checkout the repository

    $ git clone git@github.com:wizard2nd/smart_pension_test.git
    
Than go inside the project

    $ cd smart_pension_test
    
Install dependencies:

    $ bin/setup
    
Build and install gem locally:

    $ gem build smart_pension_test.gemspec
    $ gem install smart_pension_test

## Usage
Display most page views in desc order

    $ sp_log_parser parse path/to/log_file --most_views
    
Displays most unique page views in desc order
    
    $ sp_log_parser parse path/to/log_file --most_unique_views
    
To display help type:

    $ sp_log_parser help parse
    