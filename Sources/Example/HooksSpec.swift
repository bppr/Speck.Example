import Speck

let HooksSpec = describe("hooks") {
	var eachCount = 0
	var total = 0

	describe("before") {
		before { eachCount += 1 }

		it("gets run before each example") {
			expect(eachCount).to(equal: 1)
		}

		it("has run twice for the second example") {
			expect(eachCount).to(equal: 2)
		}

		describe("nested hooks") {
			before() { eachCount += 1 }

			it("run the blocks of the parent specs as well as nested") {
				expect(eachCount).to(equal: 4)
			}
		}

		describe("other nested hooks") {
			it("only runs parent hooks if no child hooks are defined") {
				expect(eachCount).to(equal: 5)
			}
		}
	}

	describe("before + after") {
		before { total += 1 }
		after { total -= 1 }

		it("runs the before hook before the spec") {
			expect(total).to(equal: 1)
		}

		it("runs the after hook after each spec as well") {
			expect(total).to(equal: 1)
		}
	}
}
