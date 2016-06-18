import Speck

struct Person: Equatable {
	let name: String
	let age: UInt
}

func ==(lhs: Person, rhs: Person) -> Bool {
	return lhs.name == rhs.name && lhs.age == rhs.age
}

let EquatableSpec = describe("`Equatable` expectations") {
	it("works with strings") {
		expect("abc").to(equal: "abc")
		expect("abc").not.to(equal: "def")
	}

	it("works with numbers") {
		expect(1).to(equal: 1)
		expect(1.25).to(equal: 1.25)
		expect(UInt(5)).to(equal: UInt(5))

		expect(1).not.to(equal: 2)
	}

	it("works with nils for simple values") {
		let maybeString: String? = nil
		let maybeInt: Int? = nil

		expect(maybeString).to(equal: nil)
		expect(maybeInt).to(equal: nil)

		expect("a").not.to(equal: nil)
		expect(42).not.to(equal: nil)
	}

	it("works with arrays") {
		expect(["a", "b", "c"]).to(equal: ["a", "b", "c"])
		expect([1, 2, 42]).to(equal: [1, 2, 42])
	}

	it("works with nil arrays") {
		let maybeArr: [Int]? = nil

		expect(maybeArr).to(equal: nil)
		expect([1]).not.to(equal: nil)
	}

	it("works with dictionaries") {
		expect(["a": "b"]).to(equal: ["a": "b"])
		expect(["a": "b"]).not.to(equal: ["c": "d"])
	}

	it("works with nil dictionaries") {
		let nilDict: [String: String]? = nil
		expect(nilDict).to(equal: nil)

		expect(["a": "b"]).not.to(equal: nil)
	}

	it("works with custom types implementing `Equatable`") {
		let person = Person(name: "Brian", age: 29)

		expect(person).to(equal: Person(name: "Brian", age: 29))
		expect(person).not.to(equal: Person(name: "Not-Brian", age: 42))
	}
}
