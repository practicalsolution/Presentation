import Quick
import Nimble
import UIKit
import Tutorial

class ContentSpec: QuickSpec {

  override func spec() {
    describe("Content") {
      var content: Content!
      var position: Position!
      var superview: UIView!

      beforeEach {
        position = Position(left: 0.2, top: 0.2)
        content = Content(view: SpecHelper.imageView(), position: position)
        superview = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 300.0, height: 200.0))
      }

      describe("#layout") {
        context("with superview") {
          beforeEach {
            superview.addSubview(content.view)
          }

          it("changes origin correctly") {
            let origin = position.originInFrame(superview.bounds)

            content.layout()
            expect(content.view.frame.origin).to(equal(origin))
          }
        }

        context("without superview") {
          it("doesn't change origin") {
            let origin = content.view.frame.origin

            content.layout()
            expect(content.view.frame.origin).to(equal(origin))
          }
        }
      }

      describe("#rotate") {
        context("with superview") {
          beforeEach {
            superview.addSubview(content.view)
          }

          it("changes view position correctly") {
            superview.addSubview(content.view)
            var rotatedFrame = superview.bounds.rotatedRect
            let origin = position.originInFrame(rotatedFrame)

            content.rotate()
            expect(content.view.frame.origin).to(equal(origin))
          }
        }

        context("without superview") {
          it("doesn't change origin") {
            let origin = content.view.frame.origin

            content.rotate()
            expect(content.view.frame.origin).to(equal(origin))
          }
        }
      }
    }
  }
}
