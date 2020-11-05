note
	description: "[
		Tests demonstrating if-then and inspect as functions
	]"
	testing: "type/manual"

class
	CONDITIONALS_AS_FUNCTIONS_TEST_SET

inherit
	EQA_TEST_SET

feature -- Test routines

	conditionals_as_functions_test
			-- Testing if-then and inspect conditional structures as functions.
		note
			testing:  "covers/{CONDITIONALS_AS_FUNCTIONS_TEST_SET}.condition_x",
						"execution/isolated",
						"execution/serial"
		do
				-- Typical if-then-else structure ...

			if condition_x then
				do_something
			else
				do_some_other_thing
			end

				-- Typical inspect-conditional structure ...

			inspect
				value
			when 1 then
				do_something
			else
				do_some_other_thing
			end

				-- An if-then as a function ...

			x := if cond1 then some_value
					else some_other_value
				end

			x := if cond1 then some_value
					elseif cond2 then some_other_value
					else still_some_other_value
				end

			x := inspect value
					when 1 then a
					when 2 then b
					else c
				end

				-- Wordy and possibly buggy ...

			if cond1 then
				x := b
			elseif cond2 then
				x := c
			else
				x := a
			end

				-- Change the above to ...
			x := if cond1 then b
					elseif cond2 then c
					else a
				end
				-- the above is very safe
		end

feature {NONE} -- Test Support

	condition_x, cond1, cond2: BOOLEAN
	x, y, value, a, b, c, d, e,
		some_value, some_other_value,
		still_some_other_value: INTEGER
	do_something do  end
	do_some_other_thing do  end

end


