use t::Utils;
use Mock::DB;
use Test::More;
use DBI;

my $dbh = DBI->connect('dbi:SQLite:', '', '');
Mock::DB->set_dbh($dbh);
Mock::DB->setup_test_db;

subtest 'dbh info' => sub {
    isa_ok +Mock::DB->dbh, 'DBI::db';
    done_testing;
};

subtest 'insert' => sub {
    Mock::DB->insert('mock_db',{id => 1 ,name => 'nekokak'});
    is +Mock::DB->count('mock_db','id',{name => 'nekokak'}), 1;
    done_testing;
};

done_testing;
