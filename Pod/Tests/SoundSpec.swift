import Quick
import Nimble

class SoundSpec: QuickSpec {

  override func spec() {

    let offsets = [
      (frequency: 445.0,
        lower: Sound.Offset(note: Note(index: 0), frequency: 5, percentage: 19.1),
        higher: Sound.Offset(note: Note(index: 1), frequency: 21.164, percentage: 80.9),
        closest: "A4"
      ),
      (frequency: 108.0,
        lower: Sound.Offset(note: Note(index: -25), frequency: 4.174, percentage: 67.6),
        higher: Sound.Offset(note: Note(index: -24), frequency: 2, percentage: 32.39),
        closest: "A2"
      )
    ]

    describe("Sound") {

      describe("Offsets") {
        describe("#init") {
          it("rearrange offsets based on frequency") {
            let sample = offsets[0]
            let offsets = Sound.Offsets(sample.higher, sample.lower)
            expect(offsets.lower.note.index).to(equal(sample.lower.note.index))
            expect(offsets.higher.note.index).to(equal(sample.higher.note.index))
          }
        }
      }

      describe("#init") {
        it("sets a correct offsets for the specified frequency") {
          offsets.forEach {
            let sound = Sound(frequency: $0.frequency)
            let result = sound.offsets

            expect(result.lower.frequency) ≈ ($0.lower.frequency, 0.01)
            expect(result.lower.percentage) ≈ ($0.lower.percentage, 0.1)
            expect(result.lower.note.index).to(equal($0.lower.note.index))

            expect(result.higher.frequency) ≈ (-$0.higher.frequency, 0.01)
            expect(result.higher.percentage) ≈ ($0.higher.percentage, 0.1)
            expect(result.higher.note.index).to(equal($0.higher.note.index))

            expect(result.closest.note.string).to(equal($0.closest))
          }
        }
      }
    }
  }
}
