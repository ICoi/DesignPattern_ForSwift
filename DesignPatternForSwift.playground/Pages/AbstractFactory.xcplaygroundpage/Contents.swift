//: [Previous](@previous)

/*:
## Abstract Factory Pattern (추상 팩토리 패턴)

### 추상 팩토리 패턴이란?
비슷한 기능을 하는 서로 관련된 객체들을 공통으로 관리가 필요할 때 사용하기 적합한 패턴

### 사용 예시
1. 동일한 기능을 시스템 별로 구분해서 사용해야 하는 경우
* 예시) MacOS 와 iOS에서 공통으로 제공되는 프로그램의 Push Notification 코드 작성
2. 동일한 기능을 하는 다양한 서비스를 공통으로 사용하는 경우
* 예시) Facebook, Google, KakaoTalk 등 다양한 외부 수단을 활용하여 로그인 진행
3.

### 사용시 장점
* 새로운 서비스가 확장되어도 포맷에 맞게 구현하여 쉽게 확장 가능함

### 사용시 단점
* 기존에 없던 기능이 추가되는 경우 모든 서비스에 대해 동일한 구현을 해야하므로 확장이 복잡함

*/

/*:
## Swift 코드 예시

### Abstract Factory 선언
*/

typealias SharedResult = (Bool, Error? ) -> Void
protocol SnsShareService {
	func postData(_ text: String, _ image: String, handler: SharedResult)
}

/*:
### Abstract Factory 구현
*/

struct FacebookShareService: SnsShareService {
	func postData(_ text: String, _ image: String, handler: (Bool, Error?) -> Void) {
		// Facebook 공유하기
		
		// Facebook.shared.shareSns(text, image) { ( result, error) {
		//     if result.isSuccess() {
		//				handler( success, nil)
		//		} else {
		//				handler( failed, nil)
		//		}
		// }
	}
}

struct GoogleShareService: SnsShareService {
	func postData(_ text: String, _ image: String, handler: (Bool, Error?) -> Void) {
		// Google 공유하기
		
		// Google.shared.shareSns(text, image) { ( result, error) {
		//     if result.isSuccess() {
		//				handler( success, nil)
		//		} else {
		//				handler( failed, nil)
		//		}
		// }
	}
}

struct PlayGoogleShareService: SnsShareService {
	func postData(_ text: String, _ image: String, handler: (Bool, Error?) -> Void) {
		// Play Google Service공유하기
		
		// PlayGoogle.shared.shareSns(text, image) { ( result, error) {
		//     if result.isSuccess() {
		//				handler( success, nil)
		//		} else {
		//				handler( failed, nil)
		//		}
		// }
	}
}

/*:
### Product Factory 선언
*/
protocol ServicesFactoryType {
	func getSocialService() -> SnsShareService
}

/*:
### Product Factory 구현
*/
struct FacebookServicesFactory : ServicesFactoryType {
	func getSocialService() -> SnsShareService {
		return FacebookShareService()
	}
}

let isPGSAvailable = false
struct GoogleServicesFactory : ServicesFactoryType {
	func getSocialService() -> SnsShareService {
		if isPGSAvailable {
			return GoogleShareService()
		} else {
			return PlayGoogleShareService()
		}
	}
}


/*:
### 서비스 로직 구현
*/

func getService( social: String) -> SnsShareService? {
	switch (social) {
	case "Facebook" :
		return FacebookServicesFactory().getSocialService()
	case "Google":
		return GoogleServicesFactory().getSocialService()
	default:
		return nil
	}
}
/// 실제 사용시
let socialService = getService(social: "Facebook")
socialService?.postData("Post Message", "Image URL") { (result, error) in
	//	if result.isSuccess {}
	//	else {}
}


//: [Next](@next)
