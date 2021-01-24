//: [Previous](@previous)

/*:
## Builder Pattern (빌더 패턴)

### 빌더 패턴이란?
객체 생성하는 방법과 표현하는 방법을 정의하는 클래스를 분리하여, 표현이 다르더라도 동일한 절차를 제공할 수 있게 하는 패턴

### 사용 예시
1. 복합 객체의 생성 알고리즘이 이를 합성하는 요소 객체들이 무엇인지 이들의 조립 방법에 독립적일 때
2. 합성할 객체들의 표현이 서로 다르더라도 생성 절차에서 이를 지원해야 할 때

### 사용시 장점
* 제품 내부의 표현을 다양하게 변화할 수 있음
* 생성과 표현에 필요한 코드를 분리
* 복합 객체를 생성하는 절차를 좀 더 세밀하게 나눌 수 있음

### 사용시 단점
* Java와 같은 언어에서는 기본적으로 Builder Pattern을 제공하는 반면, swift의 경우 Builder  패턴을 사용하기 위해서는 코드를 직접 구현해야하는 불편함이 존재 (혹은 Sourcery나 Source-Kit과 같은 기능을 활용)


### Abstract Factory Pattern VS Builder Pattern
* 복잡한 객체 생성시 Abstract Factory Pattern과 Builder Pattern은 유사한 모습을 가지고 있으나, 사용 목적이 다름
* Abstract Factory Pattern
** 제품의 유사군들이 존재할 때 유연한 설계에 중점을 둠
** 만드는 즉시 제품을 반환
* Builder Pattern
** 복잡한 객체의 단계별 생성에 중점
** 생성의 마지막 단계에서 생성한 제품을 반환


*/



import Foundation

struct Article {
	let id: String
	let title: String
	let contents: String
	let author : String
	let date: Date
	var views: Int
}


extension Article {
	class Builder {
		private var id: String = "0"
		private var title: String?
		private var contents: String?
		private var author: String?
		private var date: Date = Date()
		private var views: Int = 0
		
		func set(id: String) -> Builder {
			self.id = id
			return self
		}
				
		func set(title: String) -> Builder {
			self.title = title
			return self
		}

		func set(contents: String) -> Builder {
			self.contents = contents
			return self
		}

		func set(author: String) -> Builder {
			self.author = author
			return self
		}

		func set(date: Date) -> Builder {
			self.date = date
			return self
		}

		func set(views: Int) -> Builder {
			self.views = views
			return self
		}
		
		func build() -> Article {
			return Article(
				id: id,
				title: title!,
				contents: contents!,
				author: author!,
				date: date,
				views: views)
		}
	}
}

// 객체 생성시 필요한 요소들을 하나씩 전달받음
let builder = Article.Builder()
builder.set(author: "Daun Joung")
builder.set(title: "Title Text")
builder.set(contents: "HelloWorld")

// 해당 시점에 객체를 만듬
let article = builder.build()

//: [Next](@next)
