
import Foundation
struct Results : Codable {
	let wrapperType : String?
	let kind : String?
	let trackId : Int?
	let artistName : String?
	let trackName : String?
	let trackCensoredName : String?
	let trackViewUrl : String?
	let previewUrl : String?
	let artworkUrl30 : String?
	let artworkUrl60 : String?
	let artworkUrl100 : String?
	let collectionPrice : Double?
	let trackPrice : Double?
	let trackRentalPrice : Double?
	let collectionHdPrice : Double?
	let trackHdPrice : Double?
	let trackHdRentalPrice : Double?
	let releaseDate : String?
	let collectionExplicitness : String?
	let trackExplicitness : String?
	let trackTimeMillis : Int?
	let country : String?
	let currency : String?
	let primaryGenreName : String?
	let contentAdvisoryRating : String?
	let longDescription : String?
	let hasITunesExtras : Bool?

	enum CodingKeys: String, CodingKey {

		case wrapperType = "wrapperType"
		case kind = "kind"
		case trackId = "trackId"
		case artistName = "artistName"
		case trackName = "trackName"
		case trackCensoredName = "trackCensoredName"
		case trackViewUrl = "trackViewUrl"
		case previewUrl = "previewUrl"
		case artworkUrl30 = "artworkUrl30"
		case artworkUrl60 = "artworkUrl60"
		case artworkUrl100 = "artworkUrl100"
		case collectionPrice = "collectionPrice"
		case trackPrice = "trackPrice"
		case trackRentalPrice = "trackRentalPrice"
		case collectionHdPrice = "collectionHdPrice"
		case trackHdPrice = "trackHdPrice"
		case trackHdRentalPrice = "trackHdRentalPrice"
		case releaseDate = "releaseDate"
		case collectionExplicitness = "collectionExplicitness"
		case trackExplicitness = "trackExplicitness"
		case trackTimeMillis = "trackTimeMillis"
		case country = "country"
		case currency = "currency"
		case primaryGenreName = "primaryGenreName"
		case contentAdvisoryRating = "contentAdvisoryRating"
		case longDescription = "longDescription"
		case hasITunesExtras = "hasITunesExtras"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		wrapperType = try values.decodeIfPresent(String.self, forKey: .wrapperType)
		kind = try values.decodeIfPresent(String.self, forKey: .kind)
		trackId = try values.decodeIfPresent(Int.self, forKey: .trackId)
		artistName = try values.decodeIfPresent(String.self, forKey: .artistName)
		trackName = try values.decodeIfPresent(String.self, forKey: .trackName)
		trackCensoredName = try values.decodeIfPresent(String.self, forKey: .trackCensoredName)
		trackViewUrl = try values.decodeIfPresent(String.self, forKey: .trackViewUrl)
		previewUrl = try values.decodeIfPresent(String.self, forKey: .previewUrl)
		artworkUrl30 = try values.decodeIfPresent(String.self, forKey: .artworkUrl30)
		artworkUrl60 = try values.decodeIfPresent(String.self, forKey: .artworkUrl60)
		artworkUrl100 = try values.decodeIfPresent(String.self, forKey: .artworkUrl100)
		collectionPrice = try values.decodeIfPresent(Double.self, forKey: .collectionPrice)
		trackPrice = try values.decodeIfPresent(Double.self, forKey: .trackPrice)
		trackRentalPrice = try values.decodeIfPresent(Double.self, forKey: .trackRentalPrice)
		collectionHdPrice = try values.decodeIfPresent(Double.self, forKey: .collectionHdPrice)
		trackHdPrice = try values.decodeIfPresent(Double.self, forKey: .trackHdPrice)
		trackHdRentalPrice = try values.decodeIfPresent(Double.self, forKey: .trackHdRentalPrice)
		releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
		collectionExplicitness = try values.decodeIfPresent(String.self, forKey: .collectionExplicitness)
		trackExplicitness = try values.decodeIfPresent(String.self, forKey: .trackExplicitness)
		trackTimeMillis = try values.decodeIfPresent(Int.self, forKey: .trackTimeMillis)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		currency = try values.decodeIfPresent(String.self, forKey: .currency)
		primaryGenreName = try values.decodeIfPresent(String.self, forKey: .primaryGenreName)
		contentAdvisoryRating = try values.decodeIfPresent(String.self, forKey: .contentAdvisoryRating)
		longDescription = try values.decodeIfPresent(String.self, forKey: .longDescription)
		hasITunesExtras = try values.decodeIfPresent(Bool.self, forKey: .hasITunesExtras)
	}

}
