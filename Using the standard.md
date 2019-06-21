# Using the ICAR ADE Standard

The ADE standard is meant to be an open standard. As such, you are free to start using it,  whether to consume or to produce messages. We'll provide tips and tricks on this page to make it as easy as possible for you to start adopting this standard.  

## Scope of the Standard
The standard currently focuses on JSON messages defined in JSON Schema. These messages can be transported via REST or via any other channel. We are also working on a recommended URL scheme if you want to use REST. For now, you can find an example URL scheme to help you navigate and decide how to use the standard. This scheme is defined in the OpenAPI Specification v3. 

## Getting Started
Most developers should be familiar with REST and JSON files. To simply view the standard, you can open the [exampleUrlScheme.yaml](https://raw.githubusercontent.com/adewg/ICAR/master/Release%20Candidate%20Messages/exampleUrlScheme.yaml) file in your favorite OpenAPI Specification editor.  

Or, for convenience, use the following URL to have a preview in the free Redoc tool: 
[view exampleUrlScheme.yaml](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/adewg/ICAR/master/Release%20Candidate%20Messages/exampleUrlScheme.yaml)

## Customizing the Standard
The standard aims to cover most cases in a generic way. However, there will always be regional differences or vendor specific fields that may be required to be part of a message. You are free to simply add more fields to your messages than described in the standard. When doing so, please take note of the following recommendations:
- Consider if your field is potentially standardizable. If other regions or vendors may require something similar, define it in such a way that it may become part of the standard at one time. By doing this, no technical changes may be required by the time a new version comes out which includes this field.
- If your field is not potentially standardizable, then make sure that the name you choose does not potentially conflict with future fields. E.g., use a prefix for your region or company name.

## Forward and Backward Compatibility

To ensure forward and backward compatibility for as far as we can, the standard prescribes a few guidelines.
Any consumer must use a _tolerant reader pattern_: if you encounter fields that you do not recognize (as part of the standard), you should simply ignore them. (They may be part of a newer standard, or be regional or vendor specific fields).


