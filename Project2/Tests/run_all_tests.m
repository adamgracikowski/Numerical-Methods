function [] = run_all_tests()
% Project 2, Assignment 20
% Adam Grącikowski, 327350
%
% Runs all tests (from test1 to test9).

tests = {@test1, @test2, @test3, @test4, @test5, ...
    @test6, @test7, @test8, @test9};

for i = 1:length(tests)
    % displaying test name:
    fprintf("Name:\n\t%s\n", functions(tests{i}).function);
    % invoking testing function:
    tests{i}();
end % for

end % function

