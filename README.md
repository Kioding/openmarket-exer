# 오픈마켓 프로젝트 학습


### 학습키워드

- API 문서
- Table View 
- Collection View
- URLSession



### 참고 링크



<br>

# Step1

### API 모델 타입 구현



<details>
<summary>Response</summary>
<div markdown="1">

<br>

- ItemPage
  
```swift
struct ItemPage: Decodable {
    var page: Int
    var items: [ItemShortInfo]
}

struct ItemShortInfo: Decodable {
    var id: Int
    var title: String
    var price: Int
    var currency: String
    var stock: Int
    var discountedPrice: Int?
    var thumbnails: [String]
    var registrationDate: Int
    
    private enum CodingKeys: String, CodingKey {
        case id, title, price, currency, stock, thumbnails
        case discountedPrice = "discounted_price"
        case registrationDate = "registration_date"
    }
}
```
  
- ItemDetailInfo
  

```swift
struct ItemDetailInfo: Decodable {
    var id: Int
    var title: String
    var descriptions: String
    var price: Int
    var currency: String
    var stock: Int
    var discountedPrice: Int?
    var thumbnails: [String]
    var images: [String]
    var registrationDate: Int

    private enum CodingKeys: String, CodingKey {
        case id, title, descriptions, price, currency, stock, thumbnails, images
        case discountedPrice = "discounted_price"
        case registrationDate = "registration_date"
    }
}
```

</div>
</details>






<details>
<summary>Request</summary>
<div markdown="1">    
  
  <br>
  
- ItemRegistraion

```swift
struct ItemRegistration: Codable {
    var title: String
    var descriptions: String
    var price: Int
    var currency: String
    var stock: Int
    var discountedPrice: Int?
    var images: [String]
    var password: String
    
    private enum CodingKeys: String, CodingKey {
        case title, descriptions, price, currency, stock, images, password
        case discountedPrice = "discounted_price"
    }
}
```

- ItemModification
  
```swift
struct ItemModification: Codable {
    var title: String?
    var descriptions: String?
    var price: Int?
    var currency: String?
    var stock: Int?
    var discountedPrice: Int?
    var images: [String]?
    var password: String
    
    private enum CodingKeys: String, CodingKey {
        case title, descriptions, price, currency, stock, images, password
        case discountedPrice = "discounted_price"
    }
}
```
  
</div>
</details>

<br>

# Step 2
### 스토리보드
- View 
  - CustomTableViewCell - xib
  - CustomCollectionViewCell - xib
- Segmented Control
<br>

# trouble shooting
1. Type `ItemModification` does not conform to protocol `Decodable`
    - API 모델 타입 구현 시, `CodingKey` 를 통해 case를 재정의 할때 선언된 변수명과 일치하는지 확인해야한다. 
    - 스펠링 오타로 인해 발생한 오류! 대충 보았을 때 왜 틀린지 알기 어려웠다.처음엔 프로토콜을 잘못 채택했다고 생각.
2. Thread 1: "invalid nib registered for identifier (CustomCollectionViewCell) - nib must contain exactly one top level object which must be a UITableViewCell instance"
    - cell을 만들 때 collecionViewCell인데 tableView로 설정해서 생긴 오류
3. Thread 1: "could not dequeue a view of kind: UICollectionElementKindCell with identifier CustomCollectionViewCell - must register a nib or a class for the identifier or connect a prototype cell in a storyboard"
    - xib file identifier 확인
    - nib 설정 method가 CollecionViewCell이어도 tableView에 register되어 생긴 오류. 이거 찾는데 한세월
